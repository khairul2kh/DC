<%--
*  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
*
*  This file is part of Laboratory module.
*
*  Laboratory module is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.

 *  Laboratory module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Laboratory module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%> 
<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="../includes/js_css.jsp" %>
<br/>
<openmrs:require privilege="Manage Laboratory Patient Report" otherwise="/login.htm" redirect="/module/laboratory/patientReport.form" />
<openmrs:globalProperty key="hospitalcore.hospitalName" defaultValue="ddu" var="hospitalName"/>
<%@ include file="../localHeader.jsp" %>

<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('#date').datepicker({yearRange: 'c-30:c+30', dateFormat: 'dd/mm/yy', changeMonth: true, changeYear: true});
        jQuery("#searchbox").showPatientSearchBox({
            searchBoxView: "${hospitalName}/default",
            resultView: "/module/laboratory/patientsearch/${hospitalName}/patientreport",
            target: "#patientResult",
            beforeNewSearch: function () {
                jQuery("#patientSearchResultSection").hide();
            },
            success: function (data) {
                jQuery("#patientSearchResultSection").show();
            }
        });
        jQuery("#patientQueueCompleteTest").hide();

    });

    // Get patient test by patient identifier
    function getPatientReport(patientId) {
        var date = jQuery("#date").val();
        var investigation = jQuery("#investigation").val();
        var doc = jQuery("#doc").val();

        jQuery("#tests").mask();
        jQuery("#box").mask();

        $('#abc').show();
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/laboratory/searchPatientReport.form",
            data: ({
                date: date,
                patientId: patientId,
                investigation: investigation,
                doc: doc
            }),
            success: function (data) {
                jQuery("#tests").html(data);
                insertTestInfo(patientId);
                insertTestInfo(investigation);
                jQuery("#patientSearchResultSection").hide();
                jQuery("#patientQueueCompleteTest").hide();
                jQuery('#showPatientResult').show();
                $('#abc').hide();
                jQuery("#box").unmask();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                //alert(thrownError);
            }
        });
        //alert(investigation);
    }

    // Get patient test by patient identifier
    function getPatientReportFromQueue(patientId, conceptId) {
        var date = jQuery("#date").val();
        var investigation = jQuery("#investigation").val();
        var doc = jQuery("#doc").val();

        jQuery("#tests").mask();
        jQuery("#box").mask();
        jQuery("#patientQueueCompleteTest").mask();

        $('#abc').show();
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/laboratory/searchPatientReport.form",
            data: ({
                date: date,
                patientId: patientId,
                investigation: conceptId,
                doc: doc
            }),
            success: function (data) {
                jQuery("#tests").html(data);
                insertTestInfo(patientId);
                insertTestInfo(investigation);
                jQuery("#patientSearchResultSection").hide();
                jQuery("#patientQueueCompleteTest").hide();
                jQuery('#showPatientResult').show();
                $('#abc').hide();
                jQuery("#box").unmask();
                jQuery("#patientQueueCompleteTest").unmask();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                //alert(thrownError);
            }
        });
        //alert(investigation);
    }

    // Insert test information
    function insertTestInfo(patientId) {
        var date = jQuery("#date").val();

        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/laboratory/ajax/showTestInfo.htm",
            data: ({
                patientId: patientId,
                orderDate: date,
                //investigation   :investigation
            }),
            success: function (data) {
                jQuery("#patientReportTestInfo").html(data);
                jQuery("#printAreaTestInfo").html(data);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                //alert(thrownError);//
            }
        });
    }

    // Show patient report form
    function showForm(radiologyTestId, type) {
        type = escape(type);
        url = getContextPath() + "/module/laboratory/showForm.form?mode=view&height=600&width=800&radiologyTestId=" + radiologyTestId + "&type=" + type;
        tb_show("Patient report", url);
    }

    function printPatientReport() {
        jQuery("#patientReportPrintArea table").each(function (index, item) {
            //jQuery(item).attr("class", "wltable");
        });
        jQuery("#patientReportPrintArea").printArea({
            mode: "popup",
            popClose: true
        });
    }

    function getCompletedTestAll() {
        jQuery("#patientQueueCompleteTest").show();
        var date = jQuery("#date").val();
        jQuery.ajax({
            type: "GET",
            url: getContextPath() + "/module/laboratory/completeTestAll.htm",
            data: ({
                date: date
            }),
            success: function (data) {
                jQuery("#completeTestAllQueue").html(data);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                // alert(date);//
            }
        });
    }
</script>

<style>
    .opdSelect {
        padding:2px;
        margin: 0;
        -webkit-border-radius:4px;
        -moz-border-radius:4px;
        border-radius:4px;
        -webkit-box-shadow: 0 3px 0 #000, 0 -1px #fff inset;
        -moz-box-shadow: 0 3px 5px #000, 0 -1px #fff inset;
        box-shadow: 2px 3px 6px 4px #000, 0 -5px #fff inset;
        background: #f8f8f8;
        color:#000;
        border:none;
        outline:none;
        display: inline-block;
        -webkit-appearance:none;
        -moz-appearance:none;
        appearance:none;
        cursor:pointer;
        width:65%;
        font-size:10px;
    }
    .opdSelect option {
        -webkit-border-radius:4px;
        -moz-border-radius:4px;
        border-radius:2px;
        -webkit-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        -moz-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        padding: 5px 5px;
        height:auto;
        width:100%;

    }

    .opdSelect1 {
        padding:2px;
        margin: 0;
        -webkit-border-radius:4px;
        -moz-border-radius:4px;
        border-radius:4px;
        -webkit-box-shadow: 0 3px 0 #000, 0 -1px #fff inset;
        -moz-box-shadow: 0 3px 5px #000, 0 -1px #fff inset;
        box-shadow: 2px 3px 6px 4px #000, 0 -5px #fff inset;
        background: #f8f8f8;
        color:#000;
        border:none;
        outline:none;
        display: inline-block;
        -webkit-appearance:none;
        -moz-appearance:none;
        appearance:none;
        cursor:pointer;
        width:90%;
    }
    .opdSelect1 option {
        -webkit-border-radius:4px;
        -moz-border-radius:4px;
        border-radius:2px;
        -webkit-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        -moz-box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        box-shadow: 0 3px 0 #ccc, 0 -1px #fff inset;
        padding: 5px 5px;
        height:auto;
        width:100%;
    }
</style>

<div class="boxHeader"> 
    <strong>See patient List by choosing lab</strong>
</div>
<div id="box" class="box">
    <table>
        <tr>
            <td width="14%">
                Date:
                <input id="date" class="form-control" value="${currentDate}" style="text-align:center; width:120px;"/>
            </td>
            <td> Investigation: 
                <select name="investigation" id="investigation" class="opdSelect" >
                    <option value="select"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select Department --</option>	
                    <c:forEach var="investigation" items="${investigations}">
                        <option value="${investigation.id}">${investigation.name.name}</option>
                    </c:forEach>
                    <option value="5158">HbA1C</option>
                    <option value="3693">HBsAG(ELISA)</option>
                    <option value="2543">S. ELECTROLYTES</option>
                    <option value="2577">PT (PROTHROMBIN TIME)</option>
                    <option value="2415">URINE ROUTINE EXAMINATION</option>
                    <option value="3117">STOOL ROUTINE EXAMINATION</option>
                    <option value="5718">MANTOUX TEST</option>
                    <option value="3937">CREATININE CLEARANCE RATE (CCR)</option>
                    <option value="4252">URINARY TOTAL PROTEIN</option>
                    <option value="5148">URINE FOR KETONE BODIES</option>
                    <option value="5216">ANTI-NUCLEAR AB (ANA) & ALL</option> 
                    <option value="3092">&#946;-hCG</option>
                    <option value="5225">C3 C4</option>
                    <option value="5692">BT CT</option>
                    <option value="2413">SEMEN ANALYSIS</option>
                    <option value="5153">HBe Ag</option>
                    <option value="2615">Anti-HBe</option>
                    <option value="2614">Anti-HBc Total</option>
                    <option value="2410">CBC</option>
                </select>
            </td> 
            <td>
                <div id="searchbox"></div>	
            </td>

            <td>
                <a href="#" id='showPatientResult' style='display:none;' onclick="jQuery('#patientSearchResultSection').show();
                        jQuery('#showPatientResult').hide();">Show patients</a>
            </td>

            <td width="14%"> &nbsp;&nbsp;
                <select name="doc" id="doc" class="opdSelect1">
                    <option value="0">   -- Select Doctor --</option>	
                    <c:forEach var="doc" items="${allDoc}">
                        <option value="${doc.id}">${doc.docName}</option>
                    </c:forEach>
                </select>

            </td>

            <td width="10%" align="right">
                <input type="button" value="Print" class="bu-normal" onClick="printPatientReport();"/>
            </td>
        </tr>
        <tr>
            <td colspan="6"> <input type="button" class="bu-normal" value="Get Patient" onClick="getCompletedTestAll();"/> </td> 
        </tr>
    </table>
</div>
<br/>
<div style="position:relative; left:40%;  display:none;" id="abc" >
    <img src="${pageContext.request.contextPath}/moduleResources/laboratory/spinner.gif" id="img" 
         style=" border:1px solid #eee;  height:100px; width:100px; " /> 
</div>
<div id="patientSearchResultSection" style="display:none;">
    <div class="boxHeader">Found Patients</div>
    <div class="box" id="patientResult"></div>
</div>
<!-- This is for Complete test Queue -->
<div id="patientQueueCompleteTest" >
    <div class="boxHeader">Found Patients</div>
    <div class="box" id="completeTestAllQueue" ></div>
</div>
<div id="tests">
</div>
<%@ include file="/WEB-INF/template/footer.jsp" %>  