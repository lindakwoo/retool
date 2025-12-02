<Container
  id="KompanyDataContainer3"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{Object.keys(kompanyDataSetSearchResponse.value).length === 0}}"
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle416"
      value="#### Kompany Data"
      verticalAlign="center"
    />
  </Header>
  <View id="d9d46" viewKey="View 1">
    <Text id="text559" value="**Source** " verticalAlign="center" />
    <Text
      id="text563"
      value="{{ kompanyDataSetSearchResponse.value.content.sources[0].name}}"
      verticalAlign="center"
    />
    <Icon
      id="icon268"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.sources[0].name}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text
      id="text564"
      value="{{ kompanyDataSetSearchResponse.value.content.name}}"
      verticalAlign="center"
    />
    <Text id="text562" value="**Company Name** " verticalAlign="center" />
    <Icon
      id="icon269"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            { value: "{{ kompanyDataSetSearchResponse.value.content.name}}" },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text560" value="**OtherNames** " verticalAlign="center" />
    <Text
      id="text565"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.otherNames[0]}}"
      verticalAlign="center"
    />
    <Icon
      id="icon270"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.otherNames[0]}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text605" value="**Local Names**" verticalAlign="center" />
    <Text
      id="text606"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.localNames[0]}}"
      verticalAlign="center"
    />
    <Icon
      id="icon272"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.localNames[0]}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text607" value="**English Names**" verticalAlign="center" />
    <Text
      id="text608"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.englishNames[0]}}"
      verticalAlign="center"
    />
    <Icon
      id="icon273"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.englishNames[0]}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text630" value="**Old Names**" verticalAlign="center" />
    <Text
      id="text631"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.oldNames[0]}}"
      verticalAlign="center"
    />
    <Icon
      id="icon274"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.oldNames[0]}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text
      id="text566"
      value="{{ kompanyDataSetSearchResponse.value.content.legalForm}}"
      verticalAlign="center"
    />
    <Text id="text561" value="**LegalForm** " verticalAlign="center" />
    <Icon
      id="icon271"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.legalForm}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text567" value="**IncorporationDate** " verticalAlign="center" />
    <Text
      id="text568"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.legalEvents.incorporationDate}}"
      verticalAlign="center"
    />
    <Icon
      id="icon275"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.legalEvents.incorporationDate}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text569" value="**RegistrationDate** " verticalAlign="center" />
    <Text
      id="text570"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.legalEvents.registrationDate}}"
      verticalAlign="center"
    />
    <Icon
      id="icon276"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.legalEvents.registrationDate}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text571" value="**Email** " verticalAlign="center" />
    <Text
      id="text572"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.email}}"
      verticalAlign="center"
    />
    <Icon
      id="icon277"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.email}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text
      id="text603"
      value="**IndustryActivityCode**"
      verticalAlign="center"
    />
    <Text
      id="text604"
      value="{{ kompanyDataSetSearchResponse.value.content.industryActivityCode.activityCodes[0]}}"
      verticalAlign="center"
    />
    <Icon
      id="icon278"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.industryActivityCode.activityCodes[0]}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text573" value="**Address** " verticalAlign="center" />
    <Text
      id="text574"
      value="{{ kompanyDataSetSearchResponse.value.content.address}}"
      verticalAlign="center"
    />
    <Icon
      id="icon279"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value: "{{ kompanyDataSetSearchResponse.value.content.address}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text575" value="**FormattedAddress :** " verticalAlign="center" />
    <Text id="text588" value="**Street** " verticalAlign="center" />
    <Text
      id="text576"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.street}}"
      verticalAlign="center"
    />
    <Icon
      id="icon236"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.street}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text613" value="**addressLine2**" verticalAlign="center" />
    <Text
      id="text614"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.addressLine2}}"
      verticalAlign="center"
    />
    <Icon
      id="icon237"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.addressLine2}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text618" value="**BuildingName**" verticalAlign="center" />
    <Text
      id="text619"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.buildingName}}"
      verticalAlign="center"
    />
    <Icon
      id="icon238"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.buildingName}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text620" value="**UnitNo**" verticalAlign="center" />
    <Text
      id="text621"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.unitNo}}"
      verticalAlign="center"
    />
    <Icon
      id="icon239"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.unitNo}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text622" value="**Box**" verticalAlign="center" />
    <Text
      id="text623"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.box}}"
      verticalAlign="center"
    />
    <Icon
      id="icon240"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.box}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text616" value="**LevelNo**" verticalAlign="center" />
    <Text
      id="text617"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.levelNo}}"
      verticalAlign="center"
    />
    <Icon
      id="icon241"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.levelNo}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text615" value="**CareOf**" verticalAlign="center" />
    <Text
      id="text647"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.careOf}}"
      verticalAlign="center"
    />
    <Icon
      id="icon242"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.careOf}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text626" value="**Extra**" verticalAlign="center" />
    <Text
      id="text627"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.extra}}"
      verticalAlign="center"
    />
    <Icon
      id="icon243"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.extra}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text609" value="**Number**" verticalAlign="center" />
    <Text
      id="text610"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.number}}"
      verticalAlign="center"
    />
    <Icon
      id="icon244"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.number}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text624" value="**Addon**" verticalAlign="center" />
    <Text
      id="text625"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.addon}}"
      verticalAlign="center"
    />
    <Icon
      id="icon245"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.addon}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text611" value="**Region**" verticalAlign="center" />
    <Text
      id="text612"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.region}}"
      verticalAlign="center"
    />
    <Icon
      id="icon246"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.region}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text577" value="**District** " verticalAlign="center" />
    <Text
      id="text578"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.district}}"
      verticalAlign="center"
    />
    <Icon
      id="icon247"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.district}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text579" value="**City** " verticalAlign="center" />
    <Text
      id="text580"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.city}}"
      verticalAlign="center"
    />
    <Icon
      id="icon248"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.city}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text581" value="**Zip** " verticalAlign="center" />
    <Text
      id="text582"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.zip}}"
      verticalAlign="center"
    />
    <Icon
      id="icon249"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.zip}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text583" value="**Country** " verticalAlign="center" />
    <Text
      id="text584"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.country}}"
      verticalAlign="center"
    />
    <Icon
      id="icon250"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.country}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text585" value="**TradingAddress** " verticalAlign="center" />
    <Text
      id="text648"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.tradingAddress}}"
      verticalAlign="center"
    />
    <Icon
      id="icon251"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.tradingAddress}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text
      id="text586"
      value="**FormattedTradingAddress :** "
      verticalAlign="center"
    />
    <Text id="text589" value="**AddressLine1** " verticalAlign="center" />
    <Text
      id="text587"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.addressLine1}}"
      verticalAlign="center"
    />
    <Icon
      id="icon252"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.addressLine1}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text590" value="**addressLine2** " verticalAlign="center" />
    <Text
      id="text591"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.addressLine2}}"
      verticalAlign="center"
    />
    <Icon
      id="icon253"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.addressLine2}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text592" value="**Zip** " verticalAlign="center" />
    <Text
      id="text593"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.zip}}"
      verticalAlign="center"
    />
    <Icon
      id="icon254"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.zip}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text594" value="**Country**" verticalAlign="center" />
    <Text
      id="text595"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.country}}"
      verticalAlign="center"
    />
    <Icon
      id="icon255"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.country}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text596" value="**State**" verticalAlign="center" />
    <Text
      id="text597"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.state}}"
      verticalAlign="center"
    />
    <Icon
      id="icon256"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.state}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text598" value="**City**" verticalAlign="center" />
    <Text
      id="text599"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.city}}"
      verticalAlign="center"
    />
    <Icon
      id="icon257"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.city}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text628" value="**Phone**" verticalAlign="center" />
    <Text
      id="text629"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.phone}}"
      verticalAlign="center"
    />
    <Icon
      id="icon258"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.phone}}",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text600" value="**LocalNumber**" verticalAlign="center" />
    <Text
      id="text601"
      value={
        "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'localNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n"
      }
      verticalAlign="center"
    />
    <Icon
      id="icon259"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'localNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text632" value="**Vat**" verticalAlign="center" />
    <Text
      id="text633"
      value={
        "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'vat')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n"
      }
      verticalAlign="center"
    />
    <Icon
      id="icon260"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'vat')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text634" value="**Euid**" verticalAlign="center" />
    <Text
      id="text635"
      value={
        "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'euid')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n"
      }
      verticalAlign="center"
    />
    <Icon
      id="icon262"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'euid')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text636" value="**OtherNumber**" verticalAlign="center" />
    <Text
      id="text637"
      value={
        "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'otherNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n"
      }
      verticalAlign="center"
    />
    <Icon
      id="icon263"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'otherNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text638" value="**IdentNumber**" verticalAlign="center" />
    <Text
      id="text602"
      value={
        "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'identNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           "
      }
      verticalAlign="center"
    />
    <Icon
      id="icon261"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'identNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                                       {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'identNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           ",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text639" value="**OldNumber**" verticalAlign="center" />
    <Text
      id="text640"
      value={
        "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'oldNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           "
      }
      verticalAlign="center"
    />
    <Icon
      id="icon264"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'oldNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           ",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text643" value="**TaxNumber**" verticalAlign="center" />
    <Text
      id="text644"
      value={
        "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'taxNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           "
      }
      verticalAlign="center"
    />
    <Icon
      id="icon266"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'taxNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           ",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text645" value="**NewNumber**" verticalAlign="center" />
    <Text
      id="text646"
      value={
        "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'newNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n    "
      }
      verticalAlign="center"
    />
    <Icon
      id="icon267"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'newNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n    ",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text641" value="**Lei**" verticalAlign="center" />
    <Text
      id="text642"
      value={
        "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'lei')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           "
      }
      verticalAlign="center"
    />
    <Icon
      id="icon265"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'lei')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           ",
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
    <Text id="text649" value="**LastCheckedTime**" verticalAlign="center" />
    <Text
      id="text650"
      value={
        '{{\n  kompanyDataSetSearchResponse.value.content.sources.find(\n    s => s.lastCheckedTime && s.lastCheckedTime.trim() !== ""\n  )?.lastCheckedTime || "N/A"\n}}'
      }
      verticalAlign="center"
    />
    <Icon
      id="icon280"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      icon="bold/interface-edit-copy"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="copyToClipboard"
        params={{
          ordered: [
            {
              value:
                '{{\n  kompanyDataSetSearchResponse.value.content.sources.find(\n    s => s.lastCheckedTime && s.lastCheckedTime.trim() !== ""\n  )?.lastCheckedTime || "N/A"\n}}',
            },
          ],
        }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Icon>
  </View>
</Container>
