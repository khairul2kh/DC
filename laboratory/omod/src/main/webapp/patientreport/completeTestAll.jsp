<%-- 
    Document   : completeTestAll
    Created on : Nov 3, 2016, 11:50:02 PM
    Author     : Khairul
--%>

<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="../includes/js_css.jsp" %>
<style>
    table.kha {
        font-family:arial;
        background-color: #CDCDCD;
        font-size: 9pt;
        width: 100%;
        text-align: left;
        cursor:pointer;
    }
    table.kha thead tr th, table.kha tfoot tr th {
        height:20px;
        background: #BDBDBD;
        background: linear-gradient(#F2F2F2, #F2F2F2);
        color: #000;
        font-size: 12px;
        text-align:left;
    }
    table.kha tbody td {
        color: #3D3D3D;
        padding: 4px;
        background-color: #FFF;
        vertical-align: top;
    }

    table.kha tr:hover td{
        background-color:#58FAAC;
        cursor:pointer;
    }

</style>

<script type="text/javascript">
    jQuery(document).ready(function () {

    });
</script>

<table class="kha">
    <thead>
    <th>Patient Id </th>
    <th>Name </th>
    <th>Age</th>
    <th>Gender</th>
    <th>Test Name</th>
</thead>
<c:forEach items="${listComTest}" var="com" varStatus="varStatus" >
    <tr onClick="getPatientReport('${com.patient.patientId}');">	
        <td>${com.patient.patientIdentifier} </td>
        <td>${com.patient.givenName} ${com.patient.middleName} ${com.patient.familyName}</td>
        <td>${com.patient.age} </td>
        <td>${com.patient.gender} </td>
        <td>${com.concept.name} </td>
    </tr>
</c:forEach>
</table>

