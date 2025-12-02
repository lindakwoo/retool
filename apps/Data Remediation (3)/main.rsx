<App>
  <Include src="./functions.rsx" />
  <AppStyles id="$appStyles" css={include("./lib/$appStyles.css", "string")} />
  <CustomAppTheme
    id="$appTheme"
    _migrated={true}
    automatic={[
      "#fde68a",
      "#eecff3",
      "#a7f3d0",
      "#bfdbfe",
      "#c7d2fe",
      "#fecaca",
      "#fcd6bb",
    ]}
    borderRadius="4px"
    canvas="#f6f6f6"
    danger="#dc2626"
    defaultFont={{ map: { size: "12px" } }}
    h1Font={{ map: { size: "36px" } }}
    h2Font={{ map: { size: "28px" } }}
    h3Font={{ map: { size: "24px" } }}
    h4Font={{ map: { size: "18px" } }}
    h5Font={{ map: { size: "16px" } }}
    h6Font={{ map: { size: "14px" } }}
    highlight="#fde68a"
    info="#3170f9"
    primary="#0a1264"
    secondary="#005eff"
    success="#059669"
    surfacePrimary="#ffffff"
    surfacePrimaryBorder=""
    surfaceSecondary="#ffffff"
    surfaceSecondaryBorder=""
    tertiary=""
    textDark="#0a1264"
    textLight="#ffffff"
    warning="#cd6f00"
  />
  <Include src="./src/address.rsx" />
  <Include src="./src/auditTrail.rsx" />
  <Include src="./src/batchProcesses.rsx" />
  <Include src="./src/business.rsx" />
  <Include src="./src/digitalPresence.rsx" />
  <Include src="./src/directorIdManager.rsx" />
  <Include src="./src/entityAssignment.rsx" />
  <Include src="./src/entityDetails.rsx" />
  <Include src="./src/firmohome.rsx" />
  <Include src="./src/home.rsx" />
  <Include src="./src/identifiers.rsx" />
  <Include src="./src/ipRecords.rsx" />
  <Include src="./src/jira.rsx" />
  <Include src="./src/kompanySearch.rsx" />
  <Include src="./src/kompanySearchConfig.rsx" />
  <Include src="./src/legalInformation.rsx" />
  <Include src="./src/manageRegistryUrls.rsx" />
  <Include src="./src/remediatedRecord.rsx" />
  <Include src="./src/uploadDocument.rsx" />
  <Include src="./src/userManagement.rsx" />
  <Include src="./src/ConfirmationPopUp.rsx" />
  <Include src="./src/documentManagement.rsx" />
  <Include src="./src/documentUploadModal.rsx" />
  <Include src="./src/kompanyLiveSearchdata.rsx" />
  <Include src="./src/kompanySearchModal.rsx" />
  <Include src="./src/loadingPopUp.rsx" />
</App>
