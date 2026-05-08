<Container
  id="ProofOfDropoffcontainer"
  footerPadding="4px 12px"
  headerPadding="4px 12px"
  hidden="{{ !!!queryShipment.data.dropoff_images }}"
  padding="12px"
  showBody={true}
  showHeader={true}
>
  <Header>
    <Text
      id="containerTitle29"
      value="###### Proof of Dropoff"
      verticalAlign="center"
    />
    <Text
      id="mlClassificationText"
      value="ML Classification: {{  queryShipment.data.dropoff_images?.[0]?.image_classification_type ?? 'N/A'}} "
      verticalAlign="center"
    />
    <Text
      id="mlConfidenceText"
      value="ML Confidence: {{  queryShipment.data.dropoff_images?.[0]?.image_classification_confidence ?? 'N/A'}}
"
      verticalAlign="center"
    />
    <Button
      id="delete_dropoff_image"
      disabled="{{ queryShipment.data.dropoff_images?.[0]?.is_deleted }}"
      submitTargetId=""
      text="Delete Image"
    >
      <Event
        event="click"
        method="trigger"
        params={{}}
        pluginId="deleteDropoffImage"
        type="datasource"
        waitMs="0"
        waitType="debounce"
      />
    </Button>
    <Text
      id="imageDeletedText"
      hidden="{{ !queryShipment.data?.dropoff_images[0]?.is_deleted }}"
      value="Image has been removed for user"
      verticalAlign="center"
    />
  </Header>
  <View id="00030" viewKey="View 1">
    <Table
      id="containerDropoffImages"
      cellSelection="none"
      clearChangesetOnSave={true}
      data="{{ 
  queryShipment.data.dropoff_images?.map((img, idx) => ({
    idx,
    transformerImage: img?.s3_url
  }))
}}"
      defaultSelectedRow={{ mode: "index", indexType: "display", index: 0 }}
      dynamicRowHeights={true}
      emptyMessage="No picture found"
      enableSaveActions={true}
      groupByColumns={{}}
      hidden="{{ !!!queryShipment.data.dropoff_images }}"
      overflowType="pagination"
      primaryKeyColumnId="8675a"
      rowHeight="small"
      rowSelection="none"
      showBorder={true}
      showFooter={true}
      showHeader={true}
      templatePageSize="1"
      toolbarPosition="bottom"
    >
      <Column
        id="994c9"
        alignment="right"
        editable="false"
        editableOptions={{ showStepper: true }}
        format="decimal"
        formatOptions={{ showSeparators: true, notation: "standard" }}
        groupAggregationMode="sum"
        hidden="true"
        key="idx"
        label="Idx"
        placeholder="Enter value"
        position="center"
        size={100}
      />
      <Column
        id="b1e42"
        alignment="left"
        format="image"
        formatOptions={{
          showUnderline: "hover",
          underlineStyle: "solid",
          widthType: "fit",
        }}
        groupAggregationMode="none"
        key="transformerImage"
        label="Dropoff Images"
        placeholder="Enter value"
        position="center"
        size={100}
        summaryAggregationMode="none"
      />
      <Event
        event="clickRow"
        method="openUrl"
        params={{ map: { url: "{{ currentRow.transformerImage}}" } }}
        pluginId=""
        type="util"
        waitMs="0"
        waitType="debounce"
      />
    </Table>
  </View>
</Container>
