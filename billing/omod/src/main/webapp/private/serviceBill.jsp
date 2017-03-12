<%-- 
    Document   : serviceBill
    Created on : Nov 4, 2015, 11:18:41 PM
    Author     : khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="../includes/js_css.jsp"%>

<script type="text/javascript"
src="${pageContext.request.contextPath}/moduleResources/billing/scripts/jquery/jquery.PrintArea.js"></script>

<script>
    function isNumberKeyDot(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        //if (charCode > 31 && (charCode < 48 || charCode > 57))
        if (charCode > 31 && (charCode < 45 || charCode > 57))
            return false;
        return true;
    }
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }

    function printDivSubmit() {
        var netamount = $('#netamount').val();
        var paidamount = $('#total').val();
        var cash = $('#paidamount').val();
        var due = $('#dueamount').val();
        var disAmount = $('#discountamount').val();
        var docPercentage = $('#docGivPer').val();


        if (jQuery("#free").is(':checked')) {
            if (jQuery("#freeReason").val().length <= 0) {
                alert('Please enter Free reason');
                $("#freeReason").focus();
                return false;
            }
            else {
                if (confirm("Are you Sure ?")) {
                    $('#paidamount').val("0");
                    $('#dueamount').val("0");
                    $('#docGivPer').val("0.0");
                    jQuery("#orderBillingForm")
                            .mask("<img src='" + openmrsContextPath + "/moduleResources/billing/spinner.gif" + "'/>&nbsp;");
                    jQuery("#orderBillingForm").submit();
                }
            }
        }

        else {
            if (due < 0 || cash == "" || cash == 0 || disAmount == "")
            {
                alert("Cash Amount Empty or Cash Amount has to Getherthen Net Amount Or Discount amount empty is not valid !!!");
                $("#discountamount").focus();
                return false;
            }
            else {
                // new add
                jQuery("#orderBillingForm")
                        .mask("<img src='" + openmrsContextPath + "/moduleResources/billing/spinner.gif" + "'/>&nbsp;");
                if (confirm("Are you Sure ?")) {
                    if (docPercentage == "") {
                        $('#docGivPer').val("0.00");
                        jQuery("#orderBillingForm").submit();
                    }
                    else {
                        jQuery("#orderBillingForm").submit();
                    }
                }
                else {
                    $("#paidamount").focus();
                    jQuery("#orderBillingForm").unmask();
                    return false;
                }
            }
        }
    }

</script>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#dDate').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});

        $('#discountamount').val("0");
        $('#discount').val("0");
        $('#paidamount').val("");
        $('#dueamount').val("");
        jQuery("#freeReason").hide();
        jQuery("#paid").attr('checked', 'checked');
        $("#free").removeAttr("checked");

        $("#paid").click(function() {
            $("#freeReason").hide("fast");
            $('#paidamount').removeAttr("disabled");
            $("#free").removeAttr("checked");
        });

        $("#free").click(function() {
            if (jQuery("#free").is(':checked')) {
                $("#freeReason").show("fast");
                $('#paidamount').attr("disabled", "disabled");
                $("#paid").removeAttr("checked");
                $('#discountamount').val("0");
                $('#dueamount').val("");
                $('#discount').val("0");
                $('#netamount').val(billAmount);
                $('#paidamount').val("0");
            }
            else {
                $("#freeReason").hide("fast");
                $('#paidamount').removeAttr("disabled");
            }

        });

        jQuery("#paidamount").keyup(function(event) {
            if (event.keyCode == 13) {
                printDiv2();
                // jQuery("#orderBillingForm")
                //       .mask("<img src='" + openmrsContextPath + "/moduleResources/billing/spinner.gif" + "'/>&nbsp;");

            }
        });

        var result = 0;
        $('#BillAmount').attr('value', function() {
            $('.unitPri').each(function() {
                if ($(this).val() !== '') {
                    result += parseInt($(this).val());
                }
            });
            $('.unitPriTube').each(function() {
                if ($(this).val() !== '') {
                    result += parseInt($(this).val());
                }
            });
            return result;
        });
        var tot = 0;
        $('#totalBill').attr('value', function() {
            $('.unitPri').each(function() {
                if ($(this).val() !== '') {
                    tot += parseInt($(this).val());
                }
            });

            $('.unitPriTube').each(function() {
                if ($(this).val() !== '') {
                    tot += parseInt($(this).val());
                }
            });
            return tot;
        });

        var billAmount = $('#BillAmount').val();
        jQuery('#netamount').val(billAmount);
//        var sos =${serviceOrderSize};
//        if (sos == 0) {
//            jQuery("#savebill").hide();
//        }

        varTuebe = 0;
        $('#totalTube').attr('value', function() {
            $('.unitPriTube').each(function() {
                if ($(this).val() !== '') {
                    varTuebe += parseInt($(this).val());
                }
            });
            return varTuebe;
        });

    });
</script>

<script type="text/javascript">
    function updatePrice(incon) {
        var con = incon.toString();
        var serqunid = con.concat("servicequantity");
        var serpriid = con.concat("serviceprice");
        var unipriid = con.concat("unitprice");
        serqun = jQuery("#" + serqunid).val();
        unpri = jQuery("#" + serpriid).val();
        jQuery("#" + unipriid).val(serqun * unpri);

        var tot = 0;
        $('#totalBill').attr('value', function() {
            $('.unitPri').each(function() {
                if ($(this).val() !== '') {
                    tot += parseInt($(this).val());
                }
            });
            $('.unitPriTube').each(function() {
                if ($(this).val() !== '') {
                    tot += parseInt($(this).val());
                }
            });
            return tot;
        });

        var result = 0;
        $('#BillAmount').attr('value', function() {
            $('.unitPri').each(function() {
                if ($(this).val() !== '') {
                    result += parseInt($(this).val());
                }
            });
            $('.unitPriTube').each(function() {
                if ($(this).val() !== '') {
                    result += parseInt($(this).val());
                }
            });
            return result;
        });

        var net = 0;
        $('#netamount').attr('value', function() {
            $('.unitPri').each(function() {
                if ($(this).val() !== '') {
                    net += parseInt($(this).val());
                }
            });
            $('.unitPriTube').each(function() {
                if ($(this).val() !== '') {
                    net += parseInt($(this).val());
                }
            });
            return net;
        });

        varTuebe = 0;
        $('#totalTube').attr('value', function() {
            $('.unitPriTube').each(function() {
                if ($(this).val() !== '') {
                    varTuebe += parseInt($(this).val());
                }
            });
            return varTuebe;
        });

        //new add
        $('#discountamount').val("0");
        $('#discount').val("0");
        $('#paidamount').val("");
        $('#dueamount').val("");
    }
    function discountamountcal(incon)
    {
        var discount = incon.value;
        var billAmount = $('#totalBill').val();
        var totTube = $('#totalTube').val();
        var baWithoutTube = billAmount - totTube;
        var discountamount = (discount * baWithoutTube / 100);
        var dis = Math.round(discountamount);
        $('#discountamount').val(dis);
        var a = (billAmount - discountamount);
        var b = Math.round(a);
        // var ccc =parseInt(b) + parseInt($('#totalTube').val());
        //	$("#twa").val(ccc);
        $('#netamount').val(b);
        $('#paidamount').val("");
    }
    function lessamountcal(incon)
    {
        var discount = incon.value;
        //var net=$('#netamount').val();
        var billAmount = $('#totalBill').val();
        var lessAmount = $('#discountamount').val();
        var totTube = $('#totalTube').val();
        var baWithoutTube = billAmount - totTube;

        var less = ((lessAmount / baWithoutTube) * 100);
        var lessRound = less.toFixed(2)
        $('#discount').val(lessRound);
        //$('#netamount').val(billAmount - lessAmount);
        var n = (billAmount - lessAmount);
        $('#netamount').val(n);
        $('#paidamount').val("");
        if (n < 0) {
            alert("Less Amount Getherthen Bill Amount!");
            $('#discountamount').val("0");
            $('#netamount').val(billAmount);
            $('#discount').val("0");
        }
    }
    function dueamountcal(incon)
    {
        var paidamount = incon.value;
        var netamount = $('#netamount').val();
        var payableamount = $('#payableamount').val();
        $('#payableamount').val(netamount - paidamount);
        $('#dueamount').val(netamount - paidamount);
        $('#total').val(paidamount);
        jQuery("#totalValue2").html(toWords(jQuery("#total").val()));
    }
    function showMe(it, box) {
        var vis = (box.checked) ? "block" : "none";
        document.getElementById(it).style.display = vis;
    }

    $('#rem').live('click', function() {
        var didConfirm = confirm("Are you sure ? You want to delete !");
        if (didConfirm == true) {
            $(this).parents('tr').remove();
            $('#MyTable #tbodyId tr').each(function(index) {
                $(this).find('span.indexSerialize').html(index + 1);

                var tot = 0;
                $('#totalBill').attr('value', function() {
                    $('.unitPri').each(function() {
                        if ($(this).val() !== '') {
                            tot += parseInt($(this).val());
                        }
                    });
                    $('.unitPriTube').each(function() {
                        if ($(this).val() !== '') {
                            tot += parseInt($(this).val());
                        }
                    });
                    return tot;
                });
                var result = 0;
                $('#BillAmount').attr('value', function() {
                    $('.unitPri').each(function() {
                        if ($(this).val() !== '') {
                            result += parseInt($(this).val());
                        }
                    });
                    $('.unitPriTube').each(function() {
                        if ($(this).val() !== '') {
                            result += parseInt($(this).val());
                        }
                    });
                    return result;
                });
                var net = 0;
                $('#netamount').attr('value', function() {
                    $('.unitPri').each(function() {
                        if ($(this).val() !== '') {
                            net += parseInt($(this).val());
                        }
                    });
                    $('.unitPriTube').each(function() {
                        if ($(this).val() !== '') {
                            net += parseInt($(this).val());
                        }
                    });
                    return net;
                });

                varTuebe = 0;
                $('#totalTube').attr('value', function() {
                    $('.unitPriTube').each(function() {
                        if ($(this).val() !== '') {
                            varTuebe += parseInt($(this).val());
                        }
                    });
                    return varTuebe;
                });
                $('#discountamount').val("0");
                $('#discount').val("0");
                $('#paidamount').val("");
                $('#dueamount').val("");

            });
        }
        ;

    });
</script>

<script type="text/javascript">
    function disable(incon) {
        var icon = incon.toString();
        if (jQuery("#" + icon + "selectservice").attr('checked')) {
            jQuery("#" + icon + "servicequantity").removeAttr("disabled");
            jQuery("#" + icon + "paybill").removeAttr("disabled");
            jQuery("#" + icon + "unitprice").removeAttr("disabled");
        }
        else {
            jQuery("#" + icon + "servicequantity").attr("disabled", "disabled");
            jQuery("#" + icon + "paybill").attr("disabled", "disabled");
            jQuery("#" + icon + "unitprice").attr("disabled", "disabled");
        }
    }
</script>
<script type="text/javascript">
    function validate(serviceOrderSize) {
        for (var i = 1; i <= serviceOrderSize; i++)
        {
            var netamount = $('#netamount').val();
            var paidamount = $('#paidamount').val();
            var payableamount = $('#payableamount').val();
            var dueamount = $('dueamount').val();
            var free = $("#rem").val();
            var con = i.toString();

            if (parseFloat(paidamount) > parseFloat(netamount))
            {
                alert("Cash Amount has to Getherthen Net Amount!!!");
                return false;
            }
            if (jQuery("#free").is(':checked')) {
                $('#paidamount').val("0");
            }
            else {
                if (paidamount == 0 || paidamount == "")
                {
                    alert("Cash Amount Not Valid!!!");
                    return false;
                }
            }
            if (jQuery("#" + con + "selectservice").attr('checked')) {
                var serqunid = con.concat("servicequantity");
                serqun = jQuery("#" + serqunid).val();
                if (serqun == null || serqun == "")
                {
                    alert("Please enter quantity");
                    return false;
                }
                if (serqun != null || quantity != "") {
                    if (isNaN(serqun)) {
                        alert("Please enter quantity in correct format");
                        return false;
                    }
                }
            }
        }
        document.getElementById('savebill').disabled = true;
    }
</script>

<input type="hidden" id="pageId" value="billOrderDetailsPage" /><!--For Service AutoComplete-->
<form id="orderBillingForm" action="orderStoreSave.form"  class="kha-new" method="POST"  onsubmit="javascript:return validate($("#MyTable").find("tr").length;");">
    <h1>Bill Order Details</h1>
    <input type="hidden" id="patientId" name="patientId" value="<%= request.getParameter("patientId")%>" />
    <input type="hidden" id="orderId" name="orderId" value="<%= request.getParameter("orderId")%>" /> 
    <input type="hidden" id="refDocId" name="refDocId" value="<%= request.getParameter("refDocId")%>" />
    <input type="hidden" id="refRmpId" name="refRmpId" value="<%= request.getParameter("refRmpId")%>" />
    <input type="hidden" id="refrefMarId" name="refMarId" value="${marInfo.id}" /> 
    <input type="hidden" id="indCount" name="indCount" value="${serviceOrderSize}" />
    <input type="hidden" id="totalTube" name="totalTube" />
    <input type="hidden" id="twa" name="twa" />
    <input type="hidden" id="totalServices" name="serviceList"/> <!-- selected total service  -->
    <input type="hidden" id="totalUnit" name="totalUnit"/> <!-- selected service unit -->

    <table style="width:80%; margin:10px 0pt 15px 150px;">
        <tr> 
            <td>Patient Name :   <span style="font-weight:bold; font-size:16px; color:blue;">
                    ${patient.givenName} ${patient.middleName} ${patient.familyName}</span> </td>
            <td>Patient ID : <span style="font-weight:bold; font-size:16px; color:blue;">
                    ${patientSearch.identifier} </span> </td>
            <td>Patient Age :<b> ${age} </b> </td>
        </tr>
        <tr> 
            <td colspan="1">Phone Number : <b>${phone}</b> </td>

            <td>Gender : <c:if test="${patient.gender eq 'M'}"> <b> Male </b> </c:if> 
                <c:if test="${patient.gender eq 'F'}"> <b> Female </b> </c:if>
                </td>
            <c:if test="${not empty add.address1}">
                <td colspan="2">Patient Address : <b> ${add.address1},  ${add.cityVillage}, ${add.countyDistrict} </b> </td>
            </c:if>	
        </tr> 
        <tr> 
            <td>Referred Dr : <b> ${docInfo.doctorName} </b> </td>
            <td>Market By : <b> ${marInfo.name}</b> </td>
            <td>Order Id: <span style="font-weight:bold; font-size:20px; color:red;"> ${orderId} </span> </td>
        </tr>  
    </table>
    <br>
    <input style="width:500px; height:40px; padding:0px 0px 0px 6px; border-radius:4px 3px;margin:0px 0px 0px 150px;;font-size:16px;" 
           type="text" id="serviceName" name="serviceName" placeholder="Please type Id / Service Name" ondblclick="this.value = '';" />

    <table id="MyTable" class="kha"   width="70%">
        <thead>
            <tr>
                <th style="text-align: center;">S.No</th>
                <th style="text-align: center;">Service Name</th>
                <th style="text-align: center;">Unit</th>
                <th style="text-align: center;">Rate</th>
                <th style="text-align: center;">Action</th>
            </tr>
        </thead>
        <tbody id="tbodyId">

        </tbody>
    </table>

    <table class="kha"   width="70%">
        <tr> 
            <td colspan="3" style="border-right: solid 4px #ccc;">
                <textarea placeholder="Please Write If you want Remarks" style="width:860px; text-align:left;" rows="1" title="Remarks" name="rem" id="rem" ></textarea>
                <span style="font-size:20px; font-weight:bold; float:right;">Total Bill</span> </td>
            <td><input type="text" id="totalBill" name="totalBill"  readOnly="true" onclick="alert('This Field Read Only!!!!');"
                       style="width:100px; text-align:center;  color:blue;  font-size:18px; font-weight:bold; "/>
                <span style="font-size:20px; font-weight:bold;">TK</span></td>
        </tr>
        <tr>
            <td colspan="4"> <input type="checkbox" id="paid" name="paid" value="1" text="Paid"/> Paid &emsp;&emsp;&emsp;
                <input type="checkbox" id="free" name="free" value="0" text="Free"/> Free &emsp;
                <input type="text" style="height:30px; width:50%; font-size:15px;" placeholder="Free Reason" id="freeReason" name="freeReason" />
            </td>
        </tr>

    </table>
    <button type="button" class="delete-service bu" style="margin-left: 74%;">Remove</button>
    <br></br>
    <div>
        <div align="left" class="rcorners2" >

            <table border="1" width="90%;"   >
                <td colspan="10" align="right"><b> Bill Amount : &nbsp;</b></td>
                <td align="center">  <input type="text" id="BillAmount" name="BillAmount" size="7" value="0" readOnly="true" 
                                            style="width:100px; background:#D1E0E0; text-align:center; font-size:18px; font-weight:bold; " /> &#2547;</td>
                <tr>
                    <td colspan="10" align="right"> Discount (%) : &nbsp; </td>
                    <td align="center"> &nbsp;&nbsp;
                        <input type="text" id="discount" name="discount" style="width:100px; text-align:center;"  onkeypress="return isNumberKeyDot(event)"
                               size="7" value="0" onkeyup="discountamountcal(this)" ondblclick="this.value = '';"  /> %</td>
                </tr>
                <tr>
                    <td colspan="10" align="right"> Less Amount (Tk) : &nbsp;</td>
                    <td align="center"><input type="text" id="discountamount" name="discountamount" onkeypress="return isNumberKey(event)"
                                              style="width:100px; text-align:center; background:#D1E0E0;" onkeyup="lessamountcal(this)"
                                              size="7" value="0" ondblclick="this.value = '';" > &#2547;</td>
                </tr>
                <tr>
                    <td colspan="10" align="right"><span style="font-size:18px; font-weight:bold; color:green;"> Net Amount (Tk) :</span> &nbsp;</td>
                    <td align="center"><input type="text" id="netamount" name="netamount" 
                                              style="width:100px; font-size:18px; background:#D1E0E0; font-weight:bold; color:green; text-align:center;" 
                                              size="7" value="0" readOnly="true" > &#2547;</td>
                </tr>
                <tr>
                    <td colspan="10" align="right"><span style="font-size:18px; font-weight:bold; color:blue;"> Advanced Paid (Tk) :</span> &nbsp;</td>
                    <td align="center">
                        <input type="text" id="paidamount" name="paidamount"  placeholder="Cash Paid" onkeypress="return isNumberKey(event)" 
                               style="width:150px; height:40px; color:blue; font-weight:bold; font-size:18px; text-align:center;"   
                               size="7"  onkeyup="dueamountcal(this)" > &#2547;</td>
                </tr>

                <tr>
                    <td colspan="10" align="right"><span style="font-size:18px; font-weight:bold; color:red;"> Due Amount (Tk) :</span> &nbsp;  </td>
                    <td colspan="10" align="center"><input type="text" id="dueamount" name="dueamount" 
                                                           style="color:red; font-size:18px; font-weight:bold; text-align:center; background:#D1E0E0;"
                                                           size="7" value="0.00" readOnly="true" />  &#2547;                       
                    </td>
            </table>
        </div>
    </div>
    <div class="div2">
        <p>Delivery Date and Time</p>
        <table>
            <tr>
                <td><input type="text" id="dDate" name="dDate" placeholder="Delivery Date" class="date-pick left"
                           style="width:50%; color:green; font-size:14px; text-align:center;" />			   
                    <input type="text" id="dTime" name="dTime" placeholder="Delivery Time"
                           style="width:30%; font-size:14px; text-align:center;" /> </td>
            </tr> 
        </table>

        <br>
        <div align="center">
            <!-- <input type="submit" class="bu" id="savebill" name="savebill" value="Save bill" /> &nbsp;&nbsp;&nbsp; -->
            <!-- <input type="button" class="bu" onclick="javascript:window.location.href = 'billingqueue.form?'"  value="Cancel" /> -->
            <input type="button" class="bu" value="Save"  onclick="BILLING.ServiceList();"/> &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" class="bu" value="Add / Edit Service"  onClick="orderDetails('${patient.id}', '${orderId}', '${encounterId}');" /> 
        </div>

    </div>
    <script>
        function orderDetails(patientId, orderId, encounterId) {
            var url = "billdetails.form?patientId=" + patientId + "&orderId=" + orderId + "&encounterId=" + encounterId + "&KeepThis=true&TB_iframe=true&width=900&height=600";
            tb_show("Add or Edit Service", url);
            ///url = "showAllDiagnosis.htm?patientId="+patientId+"&opdId="+opdId+"&queueId="+queueId+"&referralId="+referralId+"&keepThis=false&TB_iframe=true&height=600&width=1000";
        }
    </script>
</form>
<%@ include file="/WEB-INF/template/footer.jsp"%>