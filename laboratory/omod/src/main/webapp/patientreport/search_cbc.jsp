<%-- 
   Document   : patientInfo
   Created on : Nov 21, 2015, 11:13:48 AM
   Author     : Khairul
--%>
<%@ include file="/WEB-INF/template/include.jsp" %>
<hr/> 
<style>
    .div1 {
        width:300px;
        background-color: white;
        border:1px solid #000;
        box-shadow: 5px 5px;
    }
</style>

<center>
    <c:forEach var="test" items="${investigation}">
        <c:choose>
            <c:when test="${investigation eq '2410' }">
                <div class="div1"><h2>HAEMATOLOGY REPORT </h2></div><br>
            </c:when>
            <c:when test="${investigation eq '2543'}">
                <div class="div1">   <h2>ELECTROLYTES REPORT</h2></div><br>
            </c:when>
            <c:otherwise>
                <!--  <h2>ALL TESTS BY GROUP</h2> -->
            </c:otherwise>                
        </c:choose>
    </c:forEach>
</center>

<center>
    <div style="width:90%" ><%@ include file="../patientreport/reportformat/patientInfo.jsp"%> </div> <br>
    <table class="tablesorter" style="width:90%">
        <c:forEach var="test" items="${investigation}">
            <c:choose>
                <c:when test="${investigation eq '2410'}">
                    <thead>
                        <tr>		
                            <th>&nbsp;&nbsp;Test </th>
                            <th style="padding-left:5px; text-align:center;" colspan="2"> Result </th>
                            <th style="padding-left:5px; width:30%"> Reference Range </th> 
                        </tr>
                    </thead> 
                </c:when>
                <c:otherwise>
                    <thead>
                        <tr>		
                            <th> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Test </th>
                            <th style="padding-left:5px;"> Result </th>
                            <th style="padding-left: 0px;"> Unit </th>
                            <th style="padding-left:5px; width:30%"> Reference Range </th> 
                        </tr>
                    </thead> 
                </c:otherwise>                
            </c:choose>
        </c:forEach>
        <tbody>
            <tr> <td colspan="4">&nbsp;</td></tr>
            <%@ include file="../patientreport/reportformat/cbc_others.jsp"%>
        </tbody>
        <div>
            <table style="width:95%">
                <thead>
                    <tr> 	
                        <th>&nbsp;&nbsp; <br><br> <b style="text-decoration: overline dotted black; "> Lab Incharge  </b> </th>
                        <th>&nbsp;&nbsp; <br><br> <b style="text-decoration: overline dotted black; "> Medical Technologist  </b> </th>
                        <th style="padding-left:0px; width:30%"><b><u> </u></b></th> 
                    </tr>
                </thead>  
                <tr>	
                    <td>  </td>
                    <td>  </td>
                    <td>
                        <c:if test="${not empty docInfo}">
                            &nbsp;&nbsp;
                            <b>${docInfo.docName}</b><br>
                            ${docInfo.degree}<br>
                            ${docInfo.designation}<br>
                            ${docInfo.workPlace}<br>
                        </c:if>
                    </td>
                </tr>
            </table>
        </div>
    </table>
</center>
<div id="patientReportPrintArea" style="display:none;">
    <style>
        table.wltable {
            font-family: Verdana, 'Lucida Grande', 'Trebuchet MS', Arial, Sans-Serif;			
            font-style: normal;
            font-size: 14px;
        }
        table.wltable th {
            border: 1px solid;
            background-color: #fff;
        }
        table.wltable td {
            padding: 5px 5px 5px 5px;
        }
        table.wltable .right {
        }
        .div1 {
            width:400px;
            background-color: white;
            border:1px solid #000;
            box-shadow: 5px 5px;
        }
    </style>
    <center>
        <c:forEach var="test" items="${investigation}">
            <c:choose>
                <c:when test="${investigation eq '4679' || investigation eq '5692' || investigation eq '2410'}">
                    <div class="div1">   <h2>HAEMATOLOGY REPORT</h2></div><br>
                </c:when>   
                <c:when test="${investigation eq '2543'}">
                    <div class="div1">   <h2>ELECTROLYTES REPORT</h2></div><br>
                </c:when>
                <c:otherwise>
                    <!--  <h2>ALL TESTS BY GROUP</h2> -->
                </c:otherwise>                
            </c:choose>
        </c:forEach>
    </center>
    <table class="wltable" cellspacing="0" style="width:100%; border: 0px solid; margin-left: auto; margin-right: auto;">
        <c:forEach var="test" items="${investigation}">
            <c:choose>
                <c:when test="${investigation eq '2410'}">
                    <thead>
                        <tr>
                            <td colspan="4"><%@ include file="../patientreport/reportformat/patientInfo.jsp"%> <br></td>
                        </tr>
                        <tr style="height:30px;">		
                            <th>&nbsp;&nbsp;Test </th>
                            <th style="padding-left:5px; text-align:center;" colspan="2"> Result </th>
                            <th style="padding-left:5px; text-align:center; width:30%"> Reference Range </th> 
                        </tr>
                    </thead> 
                </c:when>
                <c:otherwise>
                    <tr>
                        <th class="right" style="padding:5px 5px 5px 5px; border-right:1px solid #fff; width:40%; ">   &nbsp;   Test </th>
                        <th class="right" style="border-left:1px solid #fff; border-right:1px solid #fff; padding-left:5px; width:13%;"> Result </th>
                        <th class="right" style="border-left:1px solid #fff; border-right:1px solid #fff; padding-left:5px; width:10%;"> Unit </th>
                        <th class="right" style="padding-left:10px; width:30%; font-size: 13px; border-left:1px solid #fff;"> Reference Range </th>
                    </tr>
                </c:otherwise>                
            </c:choose>
        </c:forEach>
        <tbody>
            <%@ include file="../patientreport/reportformat/cbc_others.jsp"%>    
    </table>
    <label style="position:fixed; bottom:5px; font-size: 12px; width:100%" >
        <label style="position:fixed; bottom:70px; padding-left:300px;">  <b style="text-decoration: overline dotted black; font-weight: normal">  Medical Technologist </b> </label>
        <label style="position:fixed; bottom:70px;">  <b style="text-decoration: overline dotted black; font-weight: normal">  Lab Incharge  </b> </label>
        <table style="width:95%"> 
            <thead>
                <tr> 	
                    <th>&nbsp;&nbsp; <br><br> <b style="text-decoration: overline dotted black; font-weight: normal"> <!-- Checked By -->  </b> </th>
                    <th style="padding-left:0px; width:30%"><b><u> </u></b></th> 
                </tr>
            </thead>  
            <tr>	
                <td>  </td>
                <td style="font-size: 13px;">
                    <c:if test="${not empty docInfo}">
                        <b>${docInfo.docName}</b><br>
                        ${docInfo.degree}<br>
                        ${docInfo.designation}<br>
                        ${docInfo.workPlace}<br>
                    </c:if>
                </td>
            </tr>
        </table>
    </label>
</div>
<style>
    .absolute {
        position: absolute;
        top:1070px;
        right:0px;
        width: 800px;
        height: 0px;
    }
</style>