<ModalFrame
  id="documentManagement"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden="true"
  hideOnEscape={true}
  isHiddenOnMobile={true}
  overlayInteraction={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  size="fullScreen"
>
  <Header>
    <Text
      id="documentPageTitle"
      value="### Attached Documents"
      verticalAlign="center"
    />
    <Button
      id="linkKompanyAPIButton"
      disabled=""
      hidden="true"
      text="Verify By Kompany API"
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="loadingPopUp"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="trigger"
        params={{ ordered: [] }}
        pluginId="kompanyButtonScript"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="setValue"
        params={{ ordered: [{ value: "" }] }}
        pluginId="documentID"
        type="state"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="openDocumentUpload"
      disabled="{{ ValidateUserRole.data }}"
      horizontalAlign="right"
      iconBefore="bold/programming-cloud-upload-alternate"
      style={{ ordered: [] }}
    >
      <Event
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="documentUploadModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'documentID.setValue(uuid.v4().toLowerCase())\ndocUploadOrbisID.setValue(selectedCompany.value.header.entityID)\n\ndocUploadBvdID.setValue(selectedCompany.value.header.bvdID)\ndocUploadTicketID.clearValue()\ndocUploadDocName.clearValue()\ndocUploadCategory.clearValue()\ndocUploadComments.clearValue()\ndocumentUrl.clearValue()\ndocumentFileDrop.clearValue()\ndocUploadLanguage.setValue("English")\ndocUploadProduct.setValue("Firmographics")\ndocumentPreview.setFileUrl("")\ndocumentUploadTitle.setValue("### Upload Document")\n\neditDisableFlag.setValue(false)\ncreateMetadataItem.setValue({})',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Button
      id="modalCloseButton5"
      ariaLabel="Close"
      horizontalAlign="center"
      iconBefore="bold/interface-delete-1"
      loading=""
      style={{ ordered: [] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
        pluginId="documentManagement"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <Table
      id="entityMetadataTable"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ entityMetadataList.value }}"
      defaultSelectedRow={{ mode: "index", indexType: "data", index: "" }}
      dynamicColumnProperties={{ formatByIndex: "auto" }}
      emptyMessage="No Document Metadata Found"
      heightType="auto"
      rowHeight="small"
      rowSelection="none"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      style={{}}
      toolbarPosition="bottom"
    >
      <Column
        id="3c073"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="entity_id"
        label="Entity ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="a43f3"
        alignment="left"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="sum"
        key="orbis_id"
        label="Orbis ID"
        placeholder="Select option"
        position="center"
        size={128}
        summaryAggregationMode="none"
      />
      <Column
        id="6dbbf"
        alignment="left"
        editableOptions={{ showStepper: true }}
        format="string"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        key="bvd_id"
        label="Bvd ID"
        placeholder="Enter value"
        position="center"
        size={127}
        summaryAggregationMode="none"
      />
      <Column
        id="669b6"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="doc_id"
        label="Doc ID"
        placeholder="Enter value"
        position="center"
        size={305}
        summaryAggregationMode="none"
      />
      <Column
        id="8e0be"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="user_id"
        label="User ID"
        placeholder="Select option"
        position="center"
        size={233}
        summaryAggregationMode="none"
      />
      <Column
        id="0ae85"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="ticket_id"
        label="Ticket ID"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="6bab5"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="remediated_action"
        label="Remediated action"
        placeholder="Enter value"
        position="center"
        size={197}
        summaryAggregationMode="none"
      />
      <Column
        id="ee7f8"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="linked_remediated_fields"
        label="Linked remediated fields"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="c7f1a"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="remediation_verification_source"
        label="Remediation verification source"
        placeholder="Enter value"
        position="center"
        size={211}
        summaryAggregationMode="none"
      />
      <Column
        id="abfdb"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="doc_name"
        label="Doc Name"
        placeholder="Select option"
        position="center"
        referenceId="doc_name"
        size={152}
        summaryAggregationMode="none"
      />
      <Column
        id="df168"
        alignment="left"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="doc_type"
        label="Doc Type"
        placeholder="Select option"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="ed0c5"
        alignment="left"
        editable="false"
        format="tag"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="doc_category"
        label="Linked Doc Category(s)"
        placeholder="Select option"
        position="center"
        size={623}
        summaryAggregationMode="none"
        valueOverride="{{ item}}"
      />
      <Column
        id="23971"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="document_url"
        label="Document URL"
        placeholder="Enter value"
        position="center"
        size={131}
        summaryAggregationMode="none"
      />
      <Column
        id="08f80"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="doc_language"
        label="Doc Language"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="f398b"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="s3_location"
        label="S 3 location"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="7b54a"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="product"
        label="Product"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="f51da"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        key="comments"
        label="Comments"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="8b1bf"
        alignment="left"
        format="string"
        groupAggregationMode="none"
        hidden="true"
        key="status"
        label="Status"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Column
        id="e74c0"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        key="create_timestamp"
        label="Create timestamp (UTC)"
        placeholder="Enter value"
        position="center"
        size={169}
        summaryAggregationMode="none"
      />
      <Column
        id="e3667"
        alignment="left"
        format="datetime"
        groupAggregationMode="none"
        hidden="true"
        key="update_timestamp"
        label="Update timestamp (UTC)"
        placeholder="Enter value"
        position="center"
        size={193}
        summaryAggregationMode="none"
      />
      <Column
        id="6d5d2"
        alignment="center"
        cellTooltip={'"TEST"'}
        editable="true"
        format="tags"
        formatOptions={{ automaticColors: true }}
        groupAggregationMode="none"
        key="link"
        label="Link Documents*"
        optionList={{
          manualData: [
            { ordered: [{ value: "names" }, { label: "Names" }] },
            {
              ordered: [
                { value: "entityInfo" },
                { label: "Legal Information" },
              ],
            },
            {
              ordered: [
                { value: "businessDescriptions" },
                { label: "Business Description" },
              ],
            },
            {
              ordered: [
                { value: "digitalPresences" },
                { label: "Digital Presences" },
              ],
            },
            { ordered: [{ value: "addresses" }, { label: "Addresses" }] },
            { ordered: [{ value: "identifiers" }, { label: "Identifiers" }] },
          ],
          mode: "manual",
          mappedData: '{{ {"1" : "1"} }}',
        }}
        placeholder="Select Category"
        position="right"
        referenceId="links"
        size={234}
        summaryAggregationMode="none"
        tooltip="Required to link all categories that were edited"
      />
      <Column
        id="b097b"
        alignment="left"
        format="icon"
        formatOptions={{ icon: "bold/interface-edit-pencil" }}
        groupAggregationMode="none"
        hidden="{{ ValidateUserRole.data }}"
        placeholder="Enter value"
        position="right"
        referenceId="editDocument"
        size={30}
        summaryAggregationMode="none"
        valueOverride="edit"
      >
        <Event
          event="clickCell"
          method="run"
          params={{
            ordered: [
              {
                src: "console.log(\"Calculate Type\")\ndocumentFileDrop.clearValue()\n\nvar curRow = currentSourceRow\n\n\nvar ContentType = ''\n\nvar extension = curRow.doc_type.toLowerCase()\n\nif (extension == 'pdf') {\n  ContentType = 'application/pdf';\n\n} else if (extension == 'xlsx') {\n  ContentType = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';\n\n} else if (extension == 'jpeg' || extension == 'jpg') {\n  ContentType = 'image/jpeg';\n\n} else if (extension == 'png'){\n  ContentType = 'image/png';\n\n} else if (extension == 'eml'){\n  ContentType = 'message/rfc822';\n\n} else if (extension == 'msg'){\n  ContentType = 'application/vnd.ms-outlook';\n\n} else if (extension == 'txt'){\n  ContentType = 'text/plain';\n  \n} else if (extension == 'doc'){\n  ContentType = 'application/msword';\n  \n} else if (extension == 'docx'){\n  ContentType = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';\n  \n} else if (extension == 'bmp'){\n  ContentType = 'image/bmp';\n} \n\nuploadContentType.setValue(ContentType)\nuploadFileExtension.setValue(curRow.doc_type)\n\nconsole.log(\"Extension: \", extension)\nconsole.log(\"ContentType: \", ContentType)",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickCell"
          method="run"
          params={{
            ordered: [
              {
                src: 'editDisableFlag.setValue(true)\ndocumentUploadTitle.setValue("### Edit Document")\n\n\nvar curRow = currentSourceRow\nconsole.log("Cur Row: ", curRow)\n\ndocumentID.setValue(curRow.doc_id)\nconsole.log("Editing Doc ID: ", curRow.doc_id)\n\ndocUploadOrbisID.setValue(curRow.orbis_id)\n//  docUploadEntityID.setValue(curRow.entity_id)\ndocUploadBvdID.setValue(curRow.bvd_id)\ndocUploadTicketID.setValue(curRow.ticket_id)\ndocUploadDocName.setValue(curRow.doc_name)\nif (curRow.doc_category == ""){\n  docUploadCategory.clearValue()\n} else {docUploadCategory.setValue(curRow.doc_category)\n}\ndocUploadComments.setValue(curRow.comments)\ndocumentUrl.setValue(curRow.document_url)\ndocUploadLanguage.setValue(curRow.doc_language)\ndocUploadProduct.setValue(curRow.product)\ndoc_linked_remediated_fields.setValue(JSON.parse(curRow.linked_remediated_fields))\ndoc_remediated_action.setValue("update")\n\ndocumentUploadModal.show()\n\n\nawait DownloadPDF.trigger()\nvar resp = await getPDF.trigger()\n//  console.log("RESP: ", resp)\n\n//  var temp = resp.base64Data;\neditDocFile.setValue(resp)\n//  console.log("TEMP: ", temp)\n//  documentPreview.setFileUrl(temp)\n\n\n',
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="9f817"
        alignment="left"
        format="icon"
        formatOptions={{ icon: "bold/interface-download-button-2" }}
        groupAggregationMode="none"
        hidden="{{ ValidateUserRole.data }}"
        placeholder="Enter value"
        position="right"
        referenceId="downloadDocument"
        size={30}
        summaryAggregationMode="none"
        valueOverride="download"
      >
        <Event
          event="clickCell"
          method="setValue"
          params={{ ordered: [{ value: "{{currentSourceRow.doc_id}}" }] }}
          pluginId="documentID"
          type="state"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickCell"
          method="run"
          params={{
            ordered: [
              {
                src: "console.log(\"Calculate Type\")\nvar curRow = currentSourceRow\n\nvar ContentType = ''\n\nvar extension = curRow.doc_type\n\nif (extension == 'pdf') {\n  ContentType = 'application/pdf';\n\n} else if (extension == 'xlsx') {\n  ContentType = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';\n\n} else if (extension == 'jpeg' || extension == 'jpg') {\n  ContentType = 'image/jpeg';\n\n} else if (extension == 'png'){\n  ContentType = 'image/png';\n\n} else if (extension == 'eml'){\n  ContentType = 'message/rfc822';\n\n} else if (extension == 'msg'){\n  ContentType = 'application/vnd.ms-outlook';\n\n} else if (extension == 'txt'){\n  ContentType = 'text/plain';\n}\n\nuploadContentType.setValue(ContentType)\nuploadFileExtension.setValue(extension)\n\nconsole.log(\"Extension: \", extension)\nconsole.log(\"ContentType: \", ContentType)",
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickCell"
          method="run"
          params={{
            ordered: [
              {
                src: 'console.log("Downloading Doc ID: ", documentID.value)\n\nawait DownloadPDF.trigger()\n\nvar getPDFresponse = await getPDF.trigger()\n\n//  console.log("GetPDF: ", getPDFresponse)\n\nutils.downloadFile({ base64Binary: getPDFresponse.base64Data}, getPDFresponse.name, uploadFileExtension.value)',
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <Column
        id="2edb2"
        alignment="left"
        format="icon"
        formatOptions={{ icon: "bold/interface-delete-bin-1" }}
        groupAggregationMode="none"
        hidden="{{ ValidateUserRole.data }}"
        placeholder="Enter value"
        position="right"
        referenceId="deleteDocument"
        size={30}
        summaryAggregationMode="none"
        valueOverride="delete"
      >
        <Event
          event="clickCell"
          method="show"
          params={{ ordered: [] }}
          pluginId="loadingPopUp"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
        <Event
          event="clickCell"
          method="run"
          params={{
            ordered: [
              {
                src: 'var metadata_item\nif(currentSourceRow.remediation_verification_source == \'kompany_api\'){\n  metadata_item = [{\n  "remediation_verification_source" : currentSourceRow.remediation_verification_source,\n    "orbis_id" : currentSourceRow.orbis_id,\n    "status" : "inactive",\n    "remediated_action" : "delete"\n}]\n} else {\n  metadata_item = [{\n  "doc_id" : currentSourceRow.doc_id,\n  "status" : "inactive",\n  "remediated_action" : "delete"\n}]\n}\n\n\nupdateMetadataItem.setValue(metadata_item)\nconsole.log("Deleting Doc Item: ", metadata_item)\n\n\nvar response = await UpdateMetadataRecord.trigger()\n\nconsole.log("UpdateMetadataRecord RESPONSE : ", response)\n\n// Notification Banner\nif (response.statusCode === 200){\n  utils.showNotification({\n    title : "Success",\n    description: "Metadata Record Deleted Successfully",\n    notificationType: "success",\n    duration: 3,\n  });\n} else {\n  utils.showNotification({\n  title : "Error",\n  description: "Metadata Record Deletion Failed",\n  notificationType: "error",\n  duration: 3,\n  });\n}\n\nconsole.log(\'Running ReadMetadataRecord\')\nReadMetadataRecord.trigger()\n\nloadingPopUp.hide(true)',
              },
            ],
          }}
          pluginId=""
          type="script"
          waitMs="0"
          waitType="debounce"
        />
      </Column>
      <ToolbarButton
        id="1a"
        icon="bold/interface-text-formatting-filter-2"
        label="Filter"
        type="filter"
      />
      <ToolbarButton
        id="3c"
        hidden="{{ ValidateUserRole.data }}"
        icon="bold/interface-download-button-2"
        label="Download"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="exportData"
          params={{
            ordered: [{ options: { ordered: [{ fileType: "csv" }] } }],
          }}
          pluginId="entityMetadataTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <ToolbarButton
        id="4d"
        icon="bold/interface-arrows-round-left"
        label="Refresh"
        type="custom"
      >
        <Event
          event="clickToolbar"
          method="refresh"
          pluginId="entityMetadataTable"
          type="widget"
          waitMs="0"
          waitType="debounce"
        />
      </ToolbarButton>
      <Event
        event="save"
        method="run"
        params={{ ordered: [{ src: "" }] }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </Body>
  <Footer>
    <Button
      id="linkDocumentButton"
      disabled="{{ entityMetadataTable.changesetObject === null }}"
      hidden="{{false}}"
      text="Link Document"
    >
      <Event
        enabled=""
        event="click"
        method="trigger"
        params={{
          ordered: [
            {
              options: {
                object: {
                  onSuccess: null,
                  onFailure: null,
                  additionalScope: null,
                },
              },
            },
          ],
        }}
        pluginId="metadataTableSaveChanges"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Footer>
  <Event
    event="hide"
    method="run"
    params={{
      ordered: [
        {
          src: "linkKompanyAPIButton.setHidden(true)\nentityMetadataTable.selectRow({index:null})",
        },
      ],
    }}
    pluginId=""
    type="script"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
