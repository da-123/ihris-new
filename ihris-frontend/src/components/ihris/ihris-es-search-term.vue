<template>
  <label>
    <v-autocomplete
      v-if="isDropDown && !hideFilters"
      :loading="loading"
      :label="label"
      v-model="value"
      :items="items"
      outlined
      :error-messages="err_messages"
      :error="error"
      shaped
      clearable
      hide-details
      small-chips
      dense
      multiple
      @change="updateSearch()"
      @click:clear="clearSearch()"
      item-text="display"
      item-value="code">
      <template v-slot:prepend-item>
        <v-radio-group
          v-model="filterType"
          @change="updateSearch()"
          row
        >
          <v-radio
            label="Include"
            value="include"
          ></v-radio>
          <v-radio
            label="Exclude"
            value="exclude"
          ></v-radio>
        </v-radio-group>
        <v-divider></v-divider>
      </template>
    </v-autocomplete>
    <template v-else-if="!hideFilters">
      <template v-if="filterDataType == 'date'">
       <v-menu
          ref="menu"
          v-model="dateMenu"
          :close-on-content-click="false"
          transition="scale-transition"
          offset-y
          min-width="auto"
        >
          <!-- <template v-slot:activator="{ on, attrs }">
            <v-text-field
              v-model="value"
              :label="label"
              readonly
              v-bind="attrs"
              v-on="on"
              clearable
              dense
              outlined
              hide-details
              shaped
              @input="updateSearch"
            ></v-text-field>
          </template>
          <v-date-picker
            ref="picker"
            v-model="value"
            :max="new Date().toISOString().substr(0, 10)"
            min="1950-01-01"
            @change="updateSearch"
          ></v-date-picker>
        </v-menu>-->
        <template v-slot:activator="{ on, attrs }">
          <v-text-field
            v-model="value"
            :label="label"
            v-bind="attrs"
            prepend-inner-icon="mdi-calendar"
            readonly
            v-on="on"
            clearable
            outlined
            hide-details="auto"
            @input="updateSearch"
            dense
          >
          </v-text-field>
        </template>
        <v-container class="ma-0 pa-0">
          <v-row no-gutters>
            <v-card min-width="300px">
              <v-card-title class="primary white--text">
                Ethiopian Calendar<v-spacer/><v-btn
                  dark
                  class="white--text"
                  icon
                  @click="showGregorian = !showGregorian"
                  group
                  small
                  ><v-icon v-if="!showGregorian" >mdi-calendar-multiple</v-icon><v-icon v-else>mdi-calendar</v-icon></v-btn>
              </v-card-title>
              <v-card-text v-if="pickerType==='year'">
                <br />
                <v-text-field
                  v-model="etValue"
                  clearable
                  type="number"
                  :disabled="disabled"
                  :label="label"
                  :min="minYearET"
                  :max="maxYearET"
                  :rules="rules"
                  :error-messages="errors"
                  @change="updateSearch"
                  dense
                >
                </v-text-field>
              </v-card-text>
              <v-ethiopian-date-picker
                v-else
                ref="etPicker"
                label="Ethiopian"
                color="secondary"
                :landscape="$vuetify.breakpoint.smAndUp"
                v-model="etValue"
                :max="maxValueETDate"
                :min="minValueETDate"
                :type="filterDataType"
                :disabled="disabled"
                @change="updateSearch"
                locale="am"
                ></v-ethiopian-date-picker>
            </v-card>
            <v-card v-if="showGregorian" min-width="300px">
                <v-card-title class="primary white--text">
                  Gregorian Calendar<v-spacer/><v-btn
                    dark
                    class="white--text"
                    icon
                    @click="showGregorian = false"
                    group
                    small
                    ><v-icon>mdi-close</v-icon></v-btn>
                </v-card-title>
                <v-card-text v-if="pickerType==='year'">
                  <br />
                  <v-text-field
                    v-model="value"
                    clearable
                    type="number"
                    :disabled="disabled"
                    :label="label"
                    :min="minYear"
                    :max="maxYear"
                    :rules="rules"
                    :error-messages="errors"
                    @change="updateSearch"
                    dense
                  >
                  </v-text-field>
                </v-card-text>
                <v-date-picker
                  v-else
                  ref="gPicker"
                  color="secondary"
                  :landscape="$vuetify.breakpoint.smAndUp"
                  v-model="value"
                  :max="dateValueMax"
                  :min="dateValueMin"
                  :type="filterDataType"
                  :disabled="disabled"
                  @change="updateSearch"
                  ></v-date-picker>
              </v-card>
            </v-row>
          </v-container>
        </v-menu>
      </template>
      <v-text-field v-else :label="label" v-model="value" dense outlined hide-details shaped clearable @change="updateSearch()" @click:clear="clearSearch()" />
    </template>
  </label>
</template>

<script>
import VEthiopianDatePicker from "vuetify-ethiopian-calendar"
import ethiopic from "ethiopic-calendar"

export default {
  name: "ihris-search-term",
  props: ["label","expression","isDropDown", "reportData", "hideFilters", "calendar"],
  components: {
    VEthiopianDatePicker
  },
  data: function() {
    return {
      loading: false,
      items: [],
      error: false,
      err_messages: null,
      filterType: 'include',
      value: null,
      etValue: null,
      filterDataType: '',
      pickerType: 'date',
      menu: false,
      dateMenu: false,
      showGregorian: false,
    }
  },
  mounted: function() {
    if(this.reportData.mappings.mappings.properties[this.expression]) {
      this.filterDataType = this.reportData.mappings.mappings.properties[this.expression].type
    }
    if(this.isDropDown && this.filterDataType) {
      this.loading = true;
      let url = `/es/populateFilter/${this.reportData.indexName}/${this.expression}?dataType=${this.filterDataType}`
      fetch(url, {
        method: 'GET'
      }).then(response => {
          response
            .json()
            .then(data => {
              this.loading = false;
              for(let bucket of data) {
                this.items.push(
                  bucket.key.value
                )
              }
            })
            .catch(err => {
              this.loading = false;
              this.error_message = "Unable to load results.";
              console.log(err);
            });
        })
        .catch(err => {
          this.loading = false;
          this.error_message = "Unable to load results.";
          console.log(err);
        });
    }
  },
  methods: {
    updateSearch: function() {
      this.$emit('termChange', this.expression, this.value, this.filterType)
    },
    clearSearch: function() {
      this.$emit('termChange', this.expression, [])
    },
    convertQuantity(val, direction) {
      const unitsofmeasure = {
        'a': 'years',
        'mo': 'months',
        'wk': 'weeks',
        'd': 'days',
      }
      const quant = /(-?\d+)([a-z]{1,3})/

      let match = val.match( quant )
      if ( match.length === 3 ) {
        try {
          let value = match[1]
          let unit = unitsofmeasure[ match[2] ]
          if ( direction === "subtract" ) {
            return this.$moment( this.$moment().subtract(value, unit) ).format('YYYY-MM-DD')
          } else {
            return this.$moment( this.$moment().add(value, unit) ).format('YYYY-MM-DD')
          }
        } catch (e) {
          console.log("Failed to get date from quantity",e)
        }
      }
      return undefined
    },
    convertGE(val) {
      if ( !val ) return val
      const [ year, month, day ] = val.split('-').map(Number)
      if ( this.pickerType === 'year' ) {
        let etDate = ethiopic.ge( year, month || 6, day || 1) // so it will be the same year in both directions
        return etDate.year.toString().padStart(4,'0') 
      } else {
        let etDate = ethiopic.ge( year, month || 1, day || 1)
        return etDate.year.toString().padStart(4,'0') + "-" + etDate.month.toString().padStart(2,'0') + "-" + etDate.day.toString().padStart(2, '0')
      }
    },
    convertEG(val) {
      if ( !val ) return val
      const [ etYear, etMonth, etDay ] = val.split('-').map(Number)
      if ( this.pickerType === 'year' ) {
        let gDate = ethiopic.eg( etYear, etMonth|| 6, etDay || 1) // so it will be the same year in both directions
        return gDate.year.toString().padStart(4,'0') 
      } else {
        let gDate = ethiopic.eg( etYear, etMonth || 1, etDay || 1)
        return gDate.year.toString().padStart(4,'0') + "-" + gDate.month.toString().padStart(2,'0') + "-" + gDate.day.toString().padStart(2, '0')
      }
    },
    save (date) {
      this.errors = []
      this.$refs.menu.save(date)
    }
  },
  computed: {
    dateValueMax: function() {
      if ( this.maxValueQuantity ) {
        let maxDate = this.convertQuantity( this.maxValueQuantity, "add" )
        if ( maxDate ) {
          return maxDate
        }
      } 
      if ( this.maxValueDate ) {
        return this.maxValueDate
      }
      return undefined
    },
    dateValueMin: function() {
      if ( this.minValueQuantity ) {
        let minDate = this.convertQuantity( this.minValueQuantity, "subtract" )
        if ( minDate ) {
          return minDate
        }
      } else if ( this.minValueDate ) {
        return this.minValueDate
      }
      return undefined
    },
    minYear: function() {
      return this.dateValueMin ? this.dateValueMin.substring(0,4) : undefined
    },
    maxYear: function() {
      return this.dateValueMax ? this.dateValueMax.substring(0,4) : undefined
    },
    minYearET: function() {
      return this.minValueETDate ? this.minValueETDate.substring(0,4) : undefined
    },
    maxYearET: function() {
      return this.maxValueETDate ? this.maxValueETDate.substring(0,4) : undefined
    },
    isEthiopian: function() {
      return this.calendar === "Ethiopian"
    },
    minValueETDate: function() {
      if ( this.dateValueMin ) {
        return this.convertGE( this.dateValueMin )
      } else {
        return null
      }
    },
    maxValueETDate: function() {
      if ( this.dateValueMax ) {
        return this.convertGE( this.dateValueMax )
      } else {
        return null
      }
    },
    displayValue: function() {
      if ( this.isEthiopian ) {
        return this.value && "Ethiopian: " + this.etValue + " Gregorian: " + this.value 
      } else {
        return this.value
      }
    }
  },
  watch: {
     menu (val) {
      if ( this.isEthiopian ) {
        !this.value && val && setTimeout(() => (this.$refs.etPicker.activePicker = 'YEAR'))
      } else {
        !this.value && val && setTimeout(() => (this.$refs.picker.activePicker = 'YEAR'))
      }
    },
    showGregorian (val) {
      !this.value && val && setTimeout(() => (this.$refs.gPicker.activePicker = 'YEAR'))
    },
    value (val) {
      if ( !val ) {
        this.etValue = val
      } else if ( this.pickerType === 'year' ) {
        if ( val.length === 4 ) {
          this.etValue = this.convertGE( val )
        }
       } else {
        this.etValue = this.convertGE( val )
      }
    },
    etValue (val) {
      if ( !val ) {
        this.value = val
      } else if ( this.pickerType === 'year' ) {
        if ( val.length === 4 ) {
          this.value = this.convertEG( val )
        }
      } else {
        this.value = this.convertEG( val )
      }
    }
  },
}
</script>
