<Container
  id="container200"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader={true}
>
  <Header>
    <Icon
      id="icon223"
      horizontalAlign="center"
      icon="bold/travel-map-location-pin"
    />
    <Text
      id="containerTitle330"
      margin="0"
      value="##### Address {{i+1}}"
      verticalAlign="center"
    />
    <ButtonGroup2 id="buttonGroup12" alignment="right" overflowPosition={1}>
      <ButtonGroup2-Button
        id="3a840"
        disabled="{{ lockEntity.value }}"
        hidden="{{selectedCompany.value.addresses.length === 1 
|| (ValidateUserRole.data ||
  ValidateBvdId.data || ValidateOrbisId.data) }}"
        icon="bold/interface-delete-bin-2"
        iconPosition="replace"
        styleVariant="transparent"
        text="Delete Address"
      >
        <Event
          event="click"
          method="trigger"
          params={{ ordered: [] }}
          pluginId="addressDeleteFlag"
          type="datasource"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="click"
          method="setValue"
          params={{
            ordered: [
              {
                value:
                  '{{\n{"iteration" : i,\n"new_value" : ["","","","","","","","",""],\n"attribute_flag" : "address",\n"ItemObjectHash" : masterRecordAllAttributeHashDict.value.address[i][1],\n  "remediation_action" : "delete"}\n  }}\n',
              },
            ],
          }}
          pluginId="linkAttributeItem"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
      </ButtonGroup2-Button>
    </ButtonGroup2>
    <Checkbox
      id="deleteFlag8"
      disabled="{{selectedCompany.value.addresses.length === 1}}"
      hidden="{{!AddressDeleteFlags.value[i]}}"
      label="Delete"
      labelAlign="right"
      labelPosition="left"
      labelWidth={100}
      marginType="normal"
    />
    <Alert2
      id="addressChangeAlert"
      heightType="fixed"
      hidden="{{
    AddressesList.value[i].item.types[0] === addressType.value &&
    AddressesList.value[i].item.localizedAddresses[0].language === addressLanguage.value &&
    AddressesList.value[i].item.localizedAddresses[0].reportedAddress.addressLines.join(', ') === addressLine.value &&
    AddressesList.value[i].item.localizedAddresses[0].reportedAddress.city === city.value &&
    (AddressesList.value[i].item.localizedAddresses[0].reportedAddress.postCode ?? '') === (postCode.value ?? '') &&
    AddressesList.value[i].item.countryISO2 === countryISO.value &&
    (AddressesList.value[i].item.localizedAddresses[0].reportedAddress.poBox ?? '') === (poBox.value ?? '') &&
    (AddressesList.value[i].item.localizedAddresses[0].reportedAddress.county ?? '') === (county.value ?? '')
}}"
      margin="0"
      value="warning"
    >
      <State
        id="2"
        actionIconPositions="right"
        actionPositions="bottom"
        actionTooltips={null}
        backgroundColors={null}
        borderColors={null}
        colors={null}
        descriptions="A change in address may result in changes to Postcode, Country, City, or State. Please verify that all address fields are correct before saving."
        iconPositions="top"
        icons="bold/interface-alert-warning-triangle"
        styleVariants="warning"
        tooltips={null}
        values="warning"
      />
      <State
        id="3"
        actionIconPositions="right"
        actionPositions="bottom"
        actionTexts="Action"
        actionTooltips={null}
        backgroundColors={null}
        borderColors={null}
        colors={null}
        descriptions="Description"
        iconPositions="center"
        icons="bold/interface-delete-circle"
        styleVariants="error"
        titles="Error"
        tooltips={null}
        values="error"
      />
    </Alert2>
  </Header>
  <View id="c85c9" viewKey="View 1">
    <Form
      id="eachAddressForm"
      disabled="{{ AddressDeleteFlags.value[i] || AddressesList.value[i].item.types[0] === '13' || AddressesList.value[i].item.types[0] === '14'}}"
      disableSubmit=""
      footerPadding="4px 12px"
      headerPadding="4px 12px"
      margin="0"
      padding="0"
      requireValidation={true}
      resetAfterSubmit={true}
      showBody={true}
      showBorder={false}
    >
      <Header>
        <Text id="formTitle46" value="#### Form title" verticalAlign="center" />
      </Header>
      <Body>
        <Select
          id="addressType"
          allowCustomValue={true}
          data="{{GlobalAddressList?.value?.value||AddressTypesList?.value}}"
          disabled=""
          disabledByIndex="{{ item.code === '13' || item.code === '14'}}"
          emptyMessage="No options"
          label="Type"
          labelPosition="top"
          labels="{{item.code}} - {{item.labels.en}}"
          marginType="normal"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{AddressesList.value[i].item.types[0] !== self.value ? '#99A7C8' : '#fff'}}",
              },
            ],
          }}
          value="{{GlobalAddressList?.value[i]?.addressType|| AddressesList?.value[i]?.item?.types[0]}}"
          values="{{item.code}}"
        >
          <Event
            event="blur"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].addressType = addressType.value;\n\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <Select
          id="addressLanguage"
          allowCustomValue={true}
          data="{{LanguagesList.value}}"
          disabled=""
          emptyMessage="No options"
          label="Language"
          labelPosition="top"
          labels="{{item.Language_code_ISO_639_1 + ' - ' + item.labels.en}}"
          marginType="normal"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{AddressesList.value[i].item.localizedAddresses[0].language !== self.value ? '#99A7C8' : '#fff'}}",
              },
            ],
          }}
          value="{{
GlobalAddressList?.value[i]?.addressLanguage ||
AddressesList?.value[i]?.item?.localizedAddresses[0]?.language
}}"
          values="{{ item.Language_code_ISO_639_1.toString() }}"
        >
          <Event
            event="blur"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].addressLanguage = addressLanguage.value;\n\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <TextInput
          id="addressLine"
          customValidation="{{AddressesListEdited.value[i].addressLine.trim() === '' && AddressesListEdited.value[i].countryISO === 'US' ? 'Address Line cannot be empty': ''}}"
          disabled=""
          hideLabel={false}
          label="Address Line"
          labelPosition="top"
          marginType="normal"
          placeholder="Enter value"
          style={{
            ordered: [
              {
                background:
                  "{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.addressLines.join(', ') !== self.value ? '#99A7C8' : '#fff'}}",
              },
            ],
          }}
          value="{{
  GlobalAddressList?.value[i]?.addressLine ||
AddressesList.value[i].item.localizedAddresses[0].reportedAddress.addressLines.join(', ')}}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].addressLine = addressLine.value;\n\n//console.log(temp[i]);\n//console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <TextInput
          id="city"
          disabled=""
          label="City"
          labelPosition="top"
          marginType="normal"
          placeholder="Enter value"
          style={{
            ordered: [
              {
                background:
                  "{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.city !== self.value ? '#99A7C8' : '#fff'}}",
              },
            ],
          }}
          value="{{
  GlobalAddressList?.value[i]?.city ||
  AddressesList?.value[i]?.item?.localizedAddresses[0]?.reportedAddress.city
}}"
        >
          <Event
            event="blur"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].city = city.value;\n\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <Text
          id="eachAddressLineValidationMsg"
          hidden="{{ self.value == '' }}"
          style={{ ordered: [{ color: "danger" }] }}
          verticalAlign="center"
        />
        <TextInput
          id="state"
          disabled="true"
          label="State"
          labelPosition="top"
          marginType="normal"
          style={{
            ordered: [
              {
                background:
                  "{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.state && AddressesList.value[i].item.localizedAddresses[0].reportedAddress.state !== self.value ? '#99A7C8' : '#fff'}}",
              },
            ],
          }}
        />
        <TextInput
          id="county"
          disabled=""
          label="County"
          labelPosition="top"
          marginType="normal"
          style={{
            ordered: [
              {
                background:
                  "{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.county ?  AddressesList.value[i].item.localizedAddresses[0].reportedAddress.county !== self.value ? '#99A7C8' : '#fff' : (self.value ? '#99A7C8' : '#fff')}}",
              },
            ],
          }}
          value="{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.county}}"
        >
          <Event
            event="blur"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].county = county.value;\n\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <TextInput
          id="postCode"
          customValidation="{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.postCode !== self.value ? AddressesListEdited.value[i].countryISO === 'US' && postCode.value.trim() === '' ? 'PostCode cannot be empty' : AddressesListEdited.value[i].countryISO === 'BR' && !/^\d{5}-\d{3}$/.test(postCode.value.trim()) ? 'Invalid Brazilian postcode format. Please enter in XXXXX-XXX format.' : '' : ''}}"
          disabled=""
          label="PostCode"
          labelPosition="top"
          marginType="normal"
          placeholder="Enter value"
          style={{
            ordered: [
              {
                background:
                  "{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.postCode ? AddressesList.value[i].item.localizedAddresses[0].reportedAddress.postCode !== self.value ? '#99A7C8' : '#fff' : self.value ? '#99A7C8' : '#fff'}}",
              },
            ],
          }}
          value="{{GlobalAddressList?.value[i]?.postCode ||
  AddressesList.value[i].item.localizedAddresses[0].reportedAddress.postCode
}}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].postCode = postCode.value;\n\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <TextInput
          id="poBox"
          disabled=""
          label="Po_Box"
          labelPosition="top"
          marginType="normal"
          placeholder="Enter value"
          style={{
            ordered: [
              {
                background:
                  "{{AddressesList.value[i].item.localizedAddresses[0].reportedAddress.poBox ? AddressesList.value[i].item.localizedAddresses[0].reportedAddress.poBox !== self.value ? '#99A7C8' : '#fff' : self.value ? '#99A7C8': '#fff'}}",
              },
            ],
          }}
          value="{{GlobalAddressList?.value[i]?.poBox ||
selectedCompany?.value?.addresses[i]?.item?.localizedAddresses[0]?.reportedAddress.poBox}}"
        >
          <Event
            event="blur"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].poBox = poBox.value;\n\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <Text
          id="eachPostCodeValidationMsg2"
          hidden="{{ self.value == '' }}"
          style={{ ordered: [{ color: "danger" }] }}
          verticalAlign="center"
        />
        <TextInput
          id="countryISO"
          disabled="true"
          label="Country Isocode"
          labelPosition="top"
          marginType="normal"
          placeholder="Enter value"
          style={{
            ordered: [
              {
                background:
                  "{{CountriesList.value.filter(function (item){\n  return item.a2 === AddressesList.value[i].item.countryISO2\n})[0].a2 !== self.value ? '#99A7C8' : '#fff'}} ",
              },
            ],
          }}
          value="{{ _.uniq(CountriesList.value).filter((item)=> {
  return item.labels.en === country.value
})[0].a2 }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].countryISO = countryISO.value;\n\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <TextInput
          id="regionGeoCode"
          disabled=""
          label="Region Geocode"
          labelPosition="top"
          placeholder="Enter value"
          style={{
            ordered: [
              {
                background:
                  "{{ AddressesList.value[i].item.geoClassifications.filter((obj) => obj.type === \"1\").length > 0 ? (AddressesList.value[i].item.geoClassifications.filter((obj) => obj.type === \"1\")[0].code !== self.value ? '#99A7C8' : '#fff' ) : self.value ? '#99A7C8' : '#fff' }}",
              },
            ],
          }}
          value={
            '{{\n  GlobalAddressList?.value[i]?.regionGeoCode \n ||\n  AddressesList?.value[i]?.item?.geoClassifications?.filter((obj) => obj.type === "1")[0].code}}\n'
          }
        >
          <Event
            event="blur"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].regionGeoCode = regionGeoCode.value;\n\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <Select
          id="country"
          data="{{ _.uniq(CountriesList.value) }}"
          disabled=""
          emptyMessage="No options"
          label="Country"
          labelPosition="top"
          labels="{{ item.labels.en }}"
          marginType="normal"
          overlayMaxHeight={375}
          placeholder="Select an option"
          required={true}
          showSelectionIndicator={true}
          style={{
            ordered: [
              {
                background:
                  "{{CountriesList.value.filter(function (item){\n  return item.a2 === AddressesList.value[i].item.countryISO2\n})[0].labels.en !== self.value ? '#99A7C8' : '#fff'}}",
              },
            ],
          }}
          value="{{ 
  CountriesList.value.filter(function(item) {
    return item.a2 === (GlobalAddressList?.value[i]?.countryISO || AddressesList?.value[i]?.item?.countryISO2);
  })[0]?.labels?.en 
}}

"
          values="{{ item.labels.en }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].country = country.value;\nconst isoCountry = _.uniq(CountriesList.value).filter((item)=> {\n  return item.labels.en === country.value\n})[0].a2;\ntemp[i].countryISO = isoCountry;\ntemp[i].countryRegion = isoCountry;\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </Select>
        <TextInput
          id="countryRegion"
          disabled="true"
          label="Country Region"
          labelPosition="top"
          marginType="normal"
          placeholder="Enter value"
          style={{
            ordered: [
              {
                background:
                  "{{CountriesList.value.filter(function (item){\n  return item.a2 === AddressesList.value[i].item.countryISO2\n})[0].a2 !== self.value ? '#99A7C8' : '#fff'}}",
              },
            ],
          }}
          value="{{ _.uniq(CountriesList.value).filter((item)=> {
  return item.labels.en === country.value
})[0].a2 }}"
        >
          <Event
            event="change"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].countryRegion = countryRegion.value;\n\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <TextInput
          id="worldRegion"
          disabled="true"
          label="World Region"
          labelPosition="top"
          marginType="normal"
          placeholder="Enter value"
          value="{{selectedCompany.value.addresses[i].item.localizedAddresses[0].reportedAddress.worldRegion}}"
        />
        <IconText
          id="phoneNumLabel20"
          icon="bold/interface-alert-information-circle"
          iconPosition="right"
          style={{ ordered: [{ fontSize: "12" }, { fontWeight: "700" }] }}
          text="Phone Numbers"
          textSize="h6"
          tooltipText="Add multiple Phone Numbers using comma (,) separated"
        />
        <IconText
          id="faxNumberLabel7"
          icon="bold/interface-alert-information-circle"
          iconPosition="right"
          style={{ ordered: [{ fontSize: "12" }, { fontWeight: "700" }] }}
          text="Fax Numbers"
          textSize="h6"
          tooltipText="Add multiple Fax Numbers using comma (,) separated"
        />
        <TextInput
          id="phoneNumber"
          disabled=""
          hidden=""
          iconBefore="bold/phone-telephone-circle"
          label=""
          labelPosition="top"
          marginType="normal"
          placeholder="Enter value"
          style={{
            ordered: [
              {
                background:
                  "{{ _.compact(AddressesList.value[i].item.localizedAddresses[0].reportedAddress.phoneNumbers).join(\", \") !== self.value ? '#99A7C8' : '#fff' }}",
              },
            ],
          }}
          value={
            '{{\n  GlobalAddressList?.value[i]?.phoneNumber  ||\n    _.compact(AddressesList.value[i].item.localizedAddresses[0].reportedAddress.phoneNumbers).join(", ")}}'
          }
        >
          <Event
            event="blur"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].phoneNumber = phoneNumber.value;\n\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
        <TextInput
          id="faxNumber"
          disabled=""
          hidden=""
          iconBefore="bold/mail-inbox-envelope-open"
          label=""
          labelPosition="top"
          labelWrap={true}
          marginType="normal"
          placeholder="Enter value"
          style={{
            ordered: [
              {
                background:
                  "{{ _.compact(AddressesList.value[i].item.localizedAddresses[0].reportedAddress.faxNumbers).join(\", \") !== self.value ? '#99A7C8' : '#fff' }}",
              },
            ],
          }}
          value={
            '{{\n   GlobalAddressList?.value[i]?.faxNumber  ||\n  _.compact(AddressesList?.value[i]?.item?.localizedAddresses[0]?.reportedAddress?.faxNumbers).join(", ")}}'
          }
        >
          <Event
            event="blur"
            method="run"
            params={{
              ordered: [
                {
                  src: "var temp = AddressesListEdited.value;\n\ntemp[i].faxNumber = faxNumber.value;\n\n//  console.log(temp[i]);\n//  console.log(temp);\nAddressesListEdited.setValue(temp);\nGlobalAddressList.setValue(temp);\n",
                },
              ],
            }}
            pluginId=""
            type="script"
            waitMs="0"
            waitType="debounce"
          />
        </TextInput>
      </Body>
      <Footer>
        <Button
          id="formButton43"
          submit={true}
          submitTargetId="eachAddressForm"
          text="Submit"
        />
      </Footer>
    </Form>
  </View>
</Container>
