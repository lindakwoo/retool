<App>
  <AppStyles id="$appStyles" css={include("./lib/$appStyles.css", "string")} />
  <DocumentTitle id="$customDocumentTitle" value="my custom title" />
  <Include src="./src/page1.rsx" />
</App>
