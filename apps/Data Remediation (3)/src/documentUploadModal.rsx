<ModalFrame
  id="documentUploadModal"
  footerPadding="8px 12px"
  headerPadding="8px 12px"
  hidden={true}
  hideOnEscape={true}
  isHiddenOnMobile={true}
  padding="8px 12px"
  showFooter={true}
  showHeader={true}
  showOverlay={true}
  size="large"
  style={{ ordered: [{ background: "surfacePrimary" }] }}
>
  <Header>
    <Text
      id="documentUploadTitle"
      value="### Document Upload"
      verticalAlign="center"
    />
    <Button
      id="modalCloseButton4"
      ariaLabel="Close"
      horizontalAlign="center"
      iconBefore="bold/interface-delete-1"
      style={{ ordered: [{ border: "transparent" }] }}
      styleVariant="outline"
    >
      <Event
        event="click"
        method="setHidden"
        params={{ ordered: [{ hidden: true }] }}
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
              src: 'uploadContentType.setValue("")\neditDocFile.setValue({})\ndocumentFilerop.setClear()',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
  </Header>
  <Body>
    <TextInput
      id="docUploadOrbisID"
      disabled="{{ editDisableFlag.value }}"
      label="Orbis ID"
      labelPosition="top"
      placeholder="Enter value"
      style={{ ordered: [] }}
      value="{{selectedCompany.value.header ?selectedCompany.value.header.entityID: ''}}"
    />
    <TextInput
      id="documentUrl"
      disabled="{{ editDisableFlag.value }}"
      label="Document Url"
      labelPosition="top"
      patternType="url"
      style={{ ordered: [] }}
      tooltipText="Document Url Is For PDF Uploads, Please Upload Locally For "
    >
      <Event
        event="change"
        method="run"
        params={{
          ordered: [
            {
              src: 'if (documentFileDrop.value.length != 0){\n  console.log("Document FileDrop Cleared")\n  documentFileDrop.clearValue();\n} \n\ndocumentPreview.setFileUrl(documentUrl.value)\n\n\n//  console.log("Document Url: ", documentUrl.value)\n//  documentPreview.\n//  //  documentPreview.src = documentUrl.value\n\n//  console.log(`SrcType: ${documentPreview.srcType}| Src: ${documentPreview.src} `)\n\n',
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
      id="text96"
      horizontalAlign="center"
      value="OR"
      verticalAlign="center"
    />
    <FileDropzone
      id="documentFileDrop"
      _isUpgraded={true}
      accept="['.pdf', '.jpeg', '.jpg', '.png', '.eml', '.msg', '.txt', '.doc', '.docx', '.bmp']"
      appendNewSelection={true}
      disabled="{{ editDisableFlag.value }}"
      label=""
      labelPosition="top"
      maxSize="250 MB"
      parseFiles={true}
      placeholder="Select or Drag and Drop"
      style={{
        ordered: [
          { border: "canvas" },
          { fontSize: "labelEmphasizedFont" },
          { fontWeight: "labelEmphasizedFont" },
          { fontFamily: "labelEmphasizedFont" },
        ],
      }}
    >
      <Event
        event="parse"
        method="run"
        params={{
          ordered: [
            {
              src: 'if (documentUrl.value != ""){\n  //  console.log("Document Url Cleared")\n  documentUrl.clearValue();\n}\n\ndocumentPreview.setFileUrl(documentFileDrop.value[0].base64Data);\n',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="parse"
        method="run"
        params={{
          ordered: [
            {
              src: "var ContentType = ''\n//  console.log(\"File: \", documentFileDrop.value[0])\nvar docName = documentFileDrop.value[0].name\nif (docName.includes('.pdf')) {\n  ContentType = 'application/pdf';\n\n} else if (docName.includes('.xlsx')) {\n  ContentType = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';\n\n} else if (docName.includes('.jpeg') || docName.includes('.jpg')) {\n  ContentType = 'image/jpeg';\n\n} else if (docName.includes('.png')){\n  ContentType = 'image/png';\n\n} else if (docName.includes('.eml')){\n  ContentType = 'message/rfc822';\n\n} else if (docName.includes('.msg')){\n  ContentType = 'application/vnd.ms-outlook';\n\n} else if (docName.includes('.txt')){\n  ContentType = 'text/plain';\n}\n\nuploadContentType.setValue(ContentType)\n\n\nvar extension = docName.split(\".\").pop()\nuploadFileExtension.setValue(extension)\n\n//  console.log(\"Extension: \", extension)\n//  console.log(\"ContentType: \", ContentType)",
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="change"
        method="setFileUrl"
        params={{ ordered: [{ value: '""' }] }}
        pluginId="documentPreview"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
    </FileDropzone>
    <TextInput
      id="docUploadBvdID"
      disabled="{{ editDisableFlag.value }}"
      label="Bvd ID"
      labelPosition="top"
      placeholder="Enter value"
      style={{ ordered: [] }}
      value="{{selectedCompany.value.header ? selectedCompany.value.header.bvdID: ''}}"
    />
    <PDFViewer
      id="documentPreview"
      hidden="{{ (documentFileDrop.value.length != [] && documentFileDrop.value[0].type.toLowerCase() != 'application/pdf') || (documentFileDrop.value.length == [] && (uploadContentType.value == null)) || (documentFileDrop.value.length == [] && ( uploadContentType.value.toLowerCase() != 'application/pdf')) }}"
      retoolFileObject="{{ documentFileDrop.value.length == [] ? editDocFile.value : documentFileDrop.value[0] }}"
      srcType="retoolFileObject"
      style={{ ordered: [] }}
    />
    <TextInput
      id="docUploadTicketID"
      label="Ticket ID"
      labelPosition="top"
      placeholder={
        '{{ !editDisableFlag.value ? urlparams.ticket ? urlparams.ticket : "Enter value" : "Enter value"}}'
      }
      style={{ ordered: [] }}
      value={
        '{{ !editDisableFlag.value ? urlparams.ticket ? urlparams.ticket : "" : ""}}'
      }
    />
    <TextInput
      id="docUploadDocName"
      label="Document Name"
      labelPosition="top"
      placeholder="Enter value"
      style={{ ordered: [] }}
    />
    <Multiselect
      id="docUploadCategory"
      disabled="{{ editDisableFlag.value }}"
      emptyMessage="No options"
      itemMode="static"
      label="Category"
      labelPosition="top"
      overlayMaxHeight={375}
      placeholder="Select options"
      required={true}
      showSelectionIndicator={true}
      wrapTags={true}
    >
      <Option
        id="4eb35"
        disabled={
          '{{  entityMetadataList.value.some(obj => obj.link.includes("names")) }}'
        }
        label="Names"
        value="names"
      />
      <Option
        id="87327"
        disabled={
          '{{  entityMetadataList.value.some(obj => obj.link.includes("entityInfo")) }}'
        }
        label="Legal Information"
        value="entityInfo"
      />
      <Option
        id="ddb77"
        disabled={
          '{{  entityMetadataList.value.some(obj => obj.link.includes("businessDescriptions")) }}'
        }
        label="Business Descriptions"
        value="businessDescriptions"
      />
      <Option
        id="423e2"
        disabled={
          '{{  entityMetadataList.value.some(obj => obj.link.includes("digitalPresences")) }}'
        }
        hidden={false}
        label="Digital Presences"
        value="digitalPresences"
      />
      <Option
        id="cbe51"
        disabled={
          '{{  entityMetadataList.value.some(obj => obj.link.includes("addresses")) }}'
        }
        hidden={false}
        label="Addresses"
        value="addresses"
      />
      <Option
        id="81b13"
        disabled={
          '{{  entityMetadataList.value.some(obj => obj.link.includes("identifiers")) }}'
        }
        hidden={false}
        label="Identifiers"
        value="identifiers"
      />
    </Multiselect>
    <TextInput
      id="docUploadLanguage"
      label="Language"
      labelPosition="top"
      placeholder="Enter value"
      style={{ ordered: [] }}
      value="English"
    />
    <TextInput
      id="docUploadProduct"
      label="Product"
      labelPosition="top"
      placeholder="Enter value"
      style={{ ordered: [] }}
      value="Firmographics"
    />
    <TextArea
      id="docUploadComments"
      autoResize={true}
      label="Comments"
      labelPosition="top"
      minLines="3"
      placeholder="Enter comments"
      style={{ ordered: [{ border: "canvas" }] }}
    />
    <Image
      id="imageDocPreview"
      fit="contain"
      heightType="fixed"
      hidden="{{ (documentFileDrop.value.length != [] && !documentFileDrop.value[0].type.toLowerCase().includes('image')) || (documentFileDrop.value.length == [] && (uploadContentType.value == null)) || (documentFileDrop.value.length == [] &&  !uploadContentType.value.toLowerCase().includes('image')) }}"
      horizontalAlign="center"
      retoolFileObject="{{ documentFileDrop.value.length == [] ? editDocFile.value : documentFileDrop.value[0] }}"
      src="https://picsum.photos/id/1025/800/600"
      srcType="retoolFileObject"
    />
    <Text
      id="textDocPreview"
      disableMarkdown={true}
      heightType="fixed"
      hidden={
        "{{ (documentFileDrop.value.length != [] && (documentFileDrop.value[0].type.toLowerCase() != '' && !documentFileDrop.value[0].type.toLowerCase().includes('message') && !documentFileDrop.value[0].type.toLowerCase().includes('text'))) || (documentFileDrop.value.length == [] && (uploadContentType.value == null || uploadContentType.value == \"\")) || (documentFileDrop.value.length == [] && (uploadContentType.value.toLowerCase() != 'application/vnd.ms-outlook' && !uploadContentType.value.toLowerCase().includes('message') && !uploadContentType.value.toLowerCase().includes('text'))) }}"
      }
      value="{{ documentFileDrop.value.length == [] ? atob(editDocFile.value.base64Data) : atob(documentFileDrop.value[0].base64Data) }}"
      verticalAlign="center"
    />
    <Text
      id="warningDocPreview"
      hidden={
        "{{ (documentFileDrop.value.length != [] && (documentFileDrop.value[0].type.toLowerCase() != 'application/msword' && documentFileDrop.value[0].type.toLowerCase() != 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')) || (documentFileDrop.value.length == [] && (uploadContentType.value == null || uploadContentType.value == \"\")) || (documentFileDrop.value.length == [] && (uploadContentType.value.toLowerCase() != 'application/msword' && uploadContentType.value.toLowerCase() != 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')) }}"
      }
      horizontalAlign="center"
      value="Document Preview Currently Does Not Support .DOC and .DOCX Files"
      verticalAlign="center"
    />
  </Body>
  <Footer>
    <Button
      id="documentSave"
      disabled={
        '{{ (docUploadOrbisID.value == "") || (docUploadBvdID.value == "") || (docUploadCategory.value.length == 0) || (docUploadLanguage.value == "") || (docUploadProduct.value == "") || (documentFileDrop.value.length == 0 && documentUrl.value == "") || editDisableFlag.value == \'true\' || documentFileDrop.invalid == true}}\n'
      }
      text="Save and Link Document
"
    >
      <Event
        enabled=""
        event="click"
        method="show"
        params={{ ordered: [] }}
        pluginId="loadingPopUp"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ editDisableFlag.value == false }}"
        event="click"
        method="run"
        params={{
          ordered: [
            {
              src: 'var doc_category = ""\n//  if (docUploadCategory.value == []){\n//    doc_category = ""\n//  } else {\n//    doc_category = ""\n  \n//  }\n\nvar create_item = {\n    "doc_id" : documentID.value,\n    "user_id" : CurrentUserObj.value.user_id.toLowerCase(),\n    "orbis_id" : docUploadOrbisID.value ,\n    "bvd_id" : docUploadBvdID.value,\n    "entity_id" :  selectedCompany.value.header.entityID ,\n    "ticket_id" :  docUploadTicketID.value.toLowerCase() ,\n    "doc_category" :  doc_category,   \n    "doc_name" : docUploadDocName.value.toLowerCase(),\n  "doc_type" : uploadFileExtension.value,\n    "linked_remediated_fields" : [],\n    "remediation_verification_source": "doc",\n    "comments" :  docUploadComments.value.toLowerCase() ,\n    "document_url" :  documentUrl.value.toLowerCase() ,     \n    "remediated_action" : "add",\n    "doc_language" :  docUploadLanguage.value.toLowerCase() ,             \n    "product" :  docUploadProduct.value.toLowerCase() \n  }\n\n\n  \nprint("metadata item: ", create_item)\ncreateMetadataItem.setValue(create_item)\n\n//  documentFileDrop.clearValue()\n\n\nnewDocumentLinks.setValue([documentID.value, docUploadCategory.value])\n',
            },
          ],
        }}
        pluginId=""
        type="script"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ editDisableFlag.value == false }}"
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
        pluginId="docUploadScript"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled="{{ editDisableFlag.value == true }}"
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
        pluginId="docUpdateScript"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        enabled=""
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="documentUploadModal"
        type="widget"
        waitMs="0"
        waitType="debounce"
      />
      <Event
        event="click"
        method="hide"
        params={{ ordered: [] }}
        pluginId="documentManagement"
        type="widget"
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
          src: 'documentPreview.setFileUrl("")\neditDisableFlag.setValue(false)',
        },
      ],
    }}
    pluginId=""
    type="script"
    waitMs="0"
    waitType="debounce"
  />
</ModalFrame>
