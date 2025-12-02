var temp = {}
const user = current_user.email;
const dateTime = moment(new Date()).format('YYYY-MM-DD h:mm:ss');
if (url.searchParams.uci) {
  temp = {
    "ticket": url?.searchParams?.ticket ? url?.searchParams?.ticket : '',
    "status": jiraUCISelectValue.value,
    "user": user,
    "update_timestamp": dateTime,
    "uci": url?.searchParams?.uci ? url?.searchParams?.uci : '',
    "comment": txtboxCommUCI.value,
    "audit_trail": JsonJira.value
  }
} else {
  temp = {
    "ticket": url?.searchParams?.ticket,
    "status": GDDJiraStausFirmo2.value,
    "user": user,
    "update_timestamp": dateTime,
    "bvd_id": url?.searchParams?.bvdId,
    "orbis_id":  url?.searchParams?.orbisId,
    "comment": GtxtboxCommentFirmo2.value,
    "audit_trail": JsonJira.value
  }
}
console.log('temp', temp);
jiraParamas.setValue(temp);
JiraStatusUpdate.trigger();