
var curCountries = CurrentUserObj.value.country_iso?.map(obj => obj.toLocaleLowerCase());

console.log(curCountries);

if (SearchedBy.value === 'uci') {
    if (CurrentUserObj.value.user_role?.includes('admin') || CurrentUserObj.value.user_role?.includes('uci_analyst') || CurrentUserObj.value.user_role?.includes('super_admin')) {
        return false;
    } else {
        return true;
    }
} else {
    if (CurrentUserObj.value.user_role?.includes('admin') || CurrentUserObj.value.user_role?.includes('super_admin')
    ) {
        return false;
    } else if (CurrentUserObj.value.permission?.includes('edit')) {
        var curBvdId = selectedCompany.value.header.bvdID.trim();
        var curBvdIdCode = curBvdId.slice(0, 2).toLocaleLowerCase();
        console.log(curBvdIdCode)
        if (!curCountries?.includes(curBvdIdCode)) {
            return true;
        } else {
            return false;
        }
    } else {
        return true;
    }
}


