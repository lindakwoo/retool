<Container
  id="KompanyDataContainerOnSide"
  _gap="0px"
  disabled=""
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden=""
  margin="0"
  padding="0"
  showBody={true}
  showBorder={false}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle116"
      value="#### Kompany Data"
      verticalAlign="center"
    />
    <Button
      id="kompanyDocumentUpload"
      disabled="{{ValidateUserRole.data }}"
      iconBefore="bold/programming-cloud-upload-alternate"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="liveSearchJsonToPdf"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="loadingPopUp"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="kompanyModalCloseButton"
      ariaLabel="Close"
      horizontalAlign="right"
      iconBefore="bold/interface-delete-1"
      loading=""
      style={{ ordered: [{ border: "rgb(255, 255, 255)" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="run"
        params={{
          ordered: [{ src: "kompanyLiveSearchdata.setHidden(true);" }],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <View id="d9d46" viewKey="View 1">
    <Text id="text141" value="**Source** " verticalAlign="center" />
    <Icon
      id="icon84"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
      id="text149"
      value="{{ kompanyDataSetSearchResponse.value.content.sources[0].name}}"
      verticalAlign="center"
    />
    <Text id="text146" value="**Company Name** " verticalAlign="center" />
    <Icon
      id="icon85"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text150"
      value="{{ kompanyDataSetSearchResponse.value.content.name}}"
      verticalAlign="center"
    />
    <Text id="text143" value="**OtherNames** " verticalAlign="center" />
    <Icon
      id="icon86"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text151"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.otherNames[0]}}"
      verticalAlign="center"
    />
    <Text id="text198" value="**Local Names**" verticalAlign="center" />
    <Icon
      id="icon89"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text199"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.localNames[0]}}"
      verticalAlign="center"
    />
    <Text id="text202" value="**English Names**" verticalAlign="center" />
    <Icon
      id="icon90"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text203"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.englishNames[0]}}"
      verticalAlign="center"
    />
    <Text id="text228" value="**Old Names**" verticalAlign="center" />
    <Icon
      id="icon91"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
      id="text229"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.otherNames.oldNames[0]}}"
      verticalAlign="center"
    />
    <Text id="text144" value="**LegalForm** " verticalAlign="center" />
    <Icon
      id="icon87"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text152"
      value="{{ kompanyDataSetSearchResponse.value.content.legalForm}}"
      verticalAlign="center"
    />
    <Text id="text156" value="**IncorporationDate** " verticalAlign="center" />
    <Icon
      id="icon95"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text157"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.legalEvents.incorporationDate}}"
      verticalAlign="center"
    />
    <Text id="text158" value="**RegistrationDate** " verticalAlign="center" />
    <Icon
      id="icon96"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text159"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.legalEvents.registrationDate}}"
      verticalAlign="center"
    />
    <Text id="text160" value="**Email** " verticalAlign="center" />
    <Icon
      id="icon97"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
      id="text161"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.email}}"
      verticalAlign="center"
    />
    <Text
      id="text196"
      value="**IndustryActivityCode**"
      verticalAlign="center"
    />
    <Icon
      id="icon98"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text197"
      value="{{ kompanyDataSetSearchResponse.value.content.industryActivityCode.activityCodes[0]}}"
      verticalAlign="center"
    />
    <Text id="text162" value="**Address** " verticalAlign="center" />
    <Icon
      id="icon99"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text163"
      value="{{ kompanyDataSetSearchResponse.value.content.address}}"
      verticalAlign="center"
    />
    <Text id="text164" value="**FormattedAddress :** " verticalAlign="center" />
    <Text id="text178" value="**Street** " verticalAlign="center" />
    <Icon
      id="icon100"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text165"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.street}}"
      verticalAlign="center"
    />
    <Text id="text208" value="**addressLine2**" verticalAlign="center" />
    <Icon
      id="icon101"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text209"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.addressLine2}}"
      verticalAlign="center"
    />
    <Text id="text214" value="**BuildingName**" verticalAlign="center" />
    <Icon
      id="icon102"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text215"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.buildingName}}"
      verticalAlign="center"
    />
    <Text id="text216" value="**UnitNo**" verticalAlign="center" />
    <Icon
      id="icon103"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text217"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.unitNo}}"
      verticalAlign="center"
    />
    <Text id="text218" value="**Box**" verticalAlign="center" />
    <Icon
      id="icon104"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text219"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.box}}"
      verticalAlign="center"
    />
    <Text id="text212" value="**LevelNo**" verticalAlign="center" />
    <Icon
      id="icon105"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text213"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.levelNo}}"
      verticalAlign="center"
    />
    <Text id="text210" value="**CareOf**" verticalAlign="center" />
    <Icon
      id="icon106"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text245"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.careOf}}"
      verticalAlign="center"
    />
    <Text id="text222" value="**Extra**" verticalAlign="center" />
    <Icon
      id="icon107"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text223"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.extra}}"
      verticalAlign="center"
    />
    <Icon
      id="icon108"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text id="text204" value="**Number**" verticalAlign="center" />
    <Text
      id="text205"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.number}}"
      verticalAlign="center"
    />
    <Text id="text220" value="**Addon**" verticalAlign="center" />
    <Icon
      id="icon109"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text221"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.addon}}"
      verticalAlign="center"
    />
    <Text id="text206" value="**Region**" verticalAlign="center" />
    <Icon
      id="icon110"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text207"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.region}}"
      verticalAlign="center"
    />
    <Text id="text166" value="**District** " verticalAlign="center" />
    <Icon
      id="icon111"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text167"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.district}}"
      verticalAlign="center"
    />
    <Text id="text168" value="**City** " verticalAlign="center" />
    <Icon
      id="icon112"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text169"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.city}}"
      verticalAlign="center"
    />
    <Text id="text170" value="**Zip** " verticalAlign="center" />
    <Icon
      id="icon113"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text171"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.zip}}"
      verticalAlign="center"
    />
    <Text id="text172" value="**Country** " verticalAlign="center" />
    <Icon
      id="icon114"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text173"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedAddress.country}}"
      verticalAlign="center"
    />
    <Text id="text174" value="**TradingAddress** " verticalAlign="center" />
    <Icon
      id="icon115"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
      id="text246"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.tradingAddress}}"
      verticalAlign="center"
    />
    <Text
      id="text176"
      value="**FormattedTradingAddress :** "
      verticalAlign="center"
    />
    <Text id="text179" value="**AddressLine1** " verticalAlign="center" />
    <Icon
      id="icon116"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text177"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.addressLine1}}"
      verticalAlign="center"
    />
    <Text id="text180" value="**addressLine2** " verticalAlign="center" />
    <Icon
      id="icon117"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text181"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.addressLine2}}"
      verticalAlign="center"
    />
    <Text id="text182" value="**Zip** " verticalAlign="center" />
    <Icon
      id="icon118"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text183"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.zip}}"
      verticalAlign="center"
    />
    <Text id="text184" value="**Country**" verticalAlign="center" />
    <Icon
      id="icon119"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text185"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.country}}"
      verticalAlign="center"
    />
    <Text id="text186" value="**State**" verticalAlign="center" />
    <Icon
      id="icon120"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text187"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.state}}"
      verticalAlign="center"
    />
    <Text id="text188" value="**City**" verticalAlign="center" />
    <Icon
      id="icon121"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text189"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.formattedTradingAddress.city}}"
      verticalAlign="center"
    />
    <Text id="text224" value="**Phone**" verticalAlign="center" />
    <Icon
      id="icon122"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text225"
      value="{{ kompanyDataSetSearchResponse.value.content.additionalData.contactInformation.phone}}"
      verticalAlign="center"
    />
    <Text id="text190" value="**LocalNumber**" verticalAlign="center" />
    <Icon
      id="icon123"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text194"
      value={
        "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'localNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n"
      }
      verticalAlign="center"
    />
    <Text id="text230" value="**Vat**" verticalAlign="center" />
    <Icon
      id="icon124"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text231"
      value={
        "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'vat')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n"
      }
      verticalAlign="center"
    />
    <Text id="text232" value="**Euid**" verticalAlign="center" />
    <Icon
      id="icon126"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text233"
      value={
        "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'euid')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n"
      }
      verticalAlign="center"
    />
    <Text id="text234" value="**OtherNumber**" verticalAlign="center" />
    <Icon
      id="icon127"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text235"
      value={
        "{{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'otherNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n"
      }
      verticalAlign="center"
    />
    <Text id="text236" value="**IdentNumber**" verticalAlign="center" />
    <Icon
      id="icon125"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text195"
      value={
        "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'identNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           "
      }
      verticalAlign="center"
    />
    <Text id="text237" value="**OldNumber**" verticalAlign="center" />
    <Icon
      id="icon128"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text238"
      value={
        "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'oldNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           "
      }
      verticalAlign="center"
    />
    <Text id="text241" value="**TaxNumber**" verticalAlign="center" />
    <Icon
      id="icon130"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text242"
      value={
        "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'taxNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           "
      }
      verticalAlign="center"
    />
    <Text id="text243" value="**NewNumber**" verticalAlign="center" />
    <Icon
      id="icon131"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text244"
      value={
        "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'newNumber')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n    "
      }
      verticalAlign="center"
    />
    <Text id="text239" value="**Lei**" verticalAlign="center" />
    <Icon
      id="icon129"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
    <Text
      id="text240"
      value={
        "            {{\n  (() => {\n    const localNumberIdentifier = Array.isArray(kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers) \n      ? kompanyDataSetSearchResponse.value.content.additionalData.otherIdentifiers\n          .find(identifier => identifier.identifierName === 'lei')\n      : null;\n\n    return localNumberIdentifier ? localNumberIdentifier.identifierValue : \"\";\n  })()\n}}\n                           "
      }
      verticalAlign="center"
    />
    <Text id="text536" value="**LastCheckedTime**" verticalAlign="center" />
    <Icon
      id="icon218"
      hidden="{{ ValidateBvdId.data || 
 ValidateOrbisId.data || 
 ValidateUserRole.data }}"
      horizontalAlign="center"
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
                '{{\n  kompanyDataSetSearchResponse.value.content.sources.find(\n    s => s.lastCheckedTime && s.lastCheckedTime.trim() !== ""\n  )?.lastCheckedTime || "N/A"\n}}\n                           ',
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
      id="text537"
      value={
        '{{\n  kompanyDataSetSearchResponse.value.content.sources.find(\n    s => s.lastCheckedTime && s.lastCheckedTime.trim() !== ""\n  )?.lastCheckedTime || "N/A"\n}}'
      }
      verticalAlign="center"
    />
  </View>
</Container>
