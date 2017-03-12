

BILLING = {
    load: function(url, container)
    {
        jQuery(container).load(url);
    },
    submitBillOrder: function() {
        jQuery('#selectedTestId option').each(function(i) {
            jQuery(this).attr("selected", "selected");
        });
        jQuery("#billOrderForm").submit();
    },
    ServiceList: function() {  //// Save / Submit form

        var SelectedService = [];
        var unitCollection = [];
        jQuery('#MyTable #tbodyId tr td:nth-child(6)').each(function(i) {
            SelectedService.push($(this).text());
        });
        SelectedService.forEach(function(element) {
            var con = element.toString();
            var serqunid = con.concat("servicequantity");
            serviceUnit = jQuery("#" + serqunid).val();
//            alert(serviceUnit);
            unitCollection.push(serviceUnit);
        });
//        alert("Total Service  " + SelectedService);
//        alert("Total Service  " + unitCollection);


        $('#totalServices').val(SelectedService);
        $('#totalUnit').val(unitCollection);

        printDivSubmit();
    },
    submitBillEditForm: function() {
        jQuery('#selectedTestDetails option').each(function(i) {
            jQuery(this).attr("selected", "selected");
        });
        jQuery("#billEditForm").submit();
    },
    onChangeTestName: function(container, id, name, price)
    {
        if (container == 'serName') {
            var exists = false;
            jQuery('#selectedTestId option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            if (exists) {
                alert('It\'s existed!');
                return false;
            }
            exists = false;
            jQuery('#availableDiagnosisList option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            jQuery("#serName").val("");
            if (exists) {
                jQuery("#availableDiagnosisList option[value=" + id + "]").appendTo("#selectedTestId");
                jQuery("#availableDiagnosisList option[value=" + id + "]").remove();
            } else {
                jQuery('#selectedTestId').append('<option value="' + id + '">' + name + '</option>');
            }
        }
    },
    onChangeServiceTestName: function(container, serviceID, name, price)
    {
        var i = $("#MyTable").find("tr").length;

        if (container == 'serviceName') {
            var exists = false;
            var con = serviceID.toString();
            var existed = con.concat("existService");
            existedvalue = jQuery("#" + existed).val();
//          Service Exist Check here 
            jQuery('#MyTable #tbodyId tr').each(function() {
                if (existedvalue == serviceID) {
                    exists = true;
                    jQuery("#serviceName").val("");
                    return false;
                }
            });
            if (exists) {
                alert('It\'s Existed !');
                return false;
            }
            exists = false;
            jQuery("#serviceName").val("");
            var markup = "<tr>\n\
                              <td><span class='indexSerialize'>" + i + "</span>.</td>\n\
                              <td><input type='text' style='width:780px; border:none; font-size:14px;' id='" + serviceID + "service' name='" + serviceID + "service' value='" + name + "' readOnly='true'></td>\n\
                              <td><input type='text' style='width:70px; text-align: center; font-size:14px;  border: 1px solid #ccc;' id='" + serviceID + "servicequantity' name='" + serviceID + "servicequantity' size='7' onkeypress='return isNumberKey(event)' onkeyup='updatePrice(" + serviceID + ");' value='" + 1 + "' class='serquncalc'/></td>\n\
                              <td><input type='text' style='width:110px; font-size:14px; text-align: center;  border: 1px solid #ccc;' id='" + serviceID + "unitprice' name='" + serviceID + "unitprice' size='7' value='" + price + "' class='unitPri' readOnly='true'></td>\n\
                              <td style='display:none;'><input type='text' style='width:110px; font-size:14px; text-align: center;  border: 1px solid #ccc;' id='" + serviceID + "serviceprice' name='" + serviceID + "serviceprice' size='7' value='" + price + "'  readOnly='true' class='serpricalc'></td>\n\
                              <td style='display:none;' class='ServiceSelected'><input type='text'id='" + serviceID + "existService'  value='" + serviceID + "'  readOnly='true'>" + serviceID + "</td>\n\
			      <td><input type='checkbox' name='record'></td>\n\
                            </tr>";
            $("#MyTable #tbodyId").append(markup);
            updatePrice(serviceID);
            i++;

        }
    },
    onChangeTestNameEdit: function(container, id, name)
    {
        if (container == 'addName') {
            var exists = false;
            jQuery('#selectedTestDetails option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            if (exists) {
                alert('It\'s existed!');
                return false;
            }
            exists = false;
            jQuery('#availableDiagnosisList option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            jQuery("#addName").val("");
            if (exists) {
                jQuery("#availableDiagnosisList option[value=" + id + "]").appendTo("#selectedTestDetails");
                jQuery("#availableDiagnosisList option[value=" + id + "]").remove();
            } else {
                jQuery('#selectedTestDetails').append('<option value="' + id + '">' + name + '</option>');
            }
        }
    },
    onChangePrice: function(container, id, name, price)
    {
        if (container == 'serPrice') {

            var exists = false;
            jQuery('#selectedPrice option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            if (exists) {
                alert('It\'s existed!');
                return false;
            }
            exists = false;
            jQuery('#availablePriceList option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            jQuery("#serPrice").val("");
            if (exists) {
                jQuery("#availablePriceList option[value=" + id + "]").appendTo("#selectedPrice");
                jQuery("#availablePriceList option[value=" + id + "]").remove();
            } else {
                jQuery('#selectedPrice').append('<option value="' + id + '">' + name + '</option>');
                jQuery('#selectedTestPrice').append('<option value="' + price + '">' + price + '</option>');
                jQuery('#price').append(price + "</br>");
            }
        }
    },
    onChangeRadio: function(thiz)
    {
        var text = jQuery(thiz).val();
        if (text != null && text != '' && text == 'admit') {
            jQuery(".tdIpdWard").show();
        } else {
            jQuery(".tdIpdWard").hide();
        }
    },
    backToQueue: function(queueId)
    {
        ACT.go('backToOpdQueue.htm?queueId=' + queueId);
    },
    onClickFollowDate: function(thiz)
    {
        jQuery('input#input_follow').attr('checked', true);
    },
    //////////

    onChangeDocMar: function(container, id, name)
    {
        if (container == 'docIdName') {
            var exists = false;
            jQuery('#selectedDocId option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            exists = false;
            jQuery("#selectedDocId").val("");
            if (exists) {
                jQuery("#availableDiagnosisList option[value=" + id + "]").appendTo("#selectedDiagnosisList");
                jQuery("#availableDiagnosisList option[value=" + id + "]").remove();
            } else {
                jQuery('#selectedDocId').append('<option value="' + id + '">' + name + '</option>');
            }
        }
    },
    onChangeRmp: function(container, id, name)
    {
        if (container == 'rmpIdName') {
            var exists = false;
            jQuery('#selectedRmpId option').each(function() {
                if (this.value == id) {
                    exists = true;
                    return false;
                }
            });
            exists = false;
            jQuery("#selectedRmpId").val("");
            if (exists) {
                jQuery("#availableDiagnosisList option[value=" + id + "]").appendTo("#selectedDiagnosisList");
                jQuery("#availableDiagnosisList option[value=" + id + "]").remove();
            } else {
                jQuery('#selectedRmpId').append('<option value="' + id + '">' + name + '</option>');
            }
        }
    }
};


