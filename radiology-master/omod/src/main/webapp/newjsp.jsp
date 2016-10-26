<%--
*  Copyright 2009 Society for Health Information Systems Programmes, India (HISP India)
*
*  This file is part of Radiology module.
*
*  Radiology module is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.

 *  Radiology module is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Radiology module.  If not, see <http://www.gnu.org/licenses/>.
 *
--%> 
<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="../includes/js_css.jsp" %>

<br/>

<style>

    .formStyle {
        margin-left:auto;
        margin-right:auto;
        border-radius:10px;
        box-shadow: 10px 10px 5px #888888;
        width: 1020px;
        max-width: 1020px;
        background: #D2E9FF;
        padding: 20px 20px 20px 20px;
        font: 16px Arial, Tahoma, Helvetica, sans-serif;
        color: #000000;
        line-height: 140%;
    }

    h1 {
        font: 24px Tahoma, Arial, Helvetica, "sans-serif";
        font-weight: bold;
        color: #173B0B;
        padding: 10px 10px 10px 20px;
        display: block;
        background: #80C2FF;
        border-bottom: 1px solid #B8DDFF;
        margin: -20px -20px 0px;
        text-align: center;
    }

    .styleButton{
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        border-radius: 10px;
        padding: 6px 15px 6px 18px;
        background: #3EB1DD;
        color: #08088A;
        box-shadow: 1px 1px 1px #4C6E91;
        text-shadow: 3px 1px 5px #ffffff;
        font-size:14px;
        font-weight:bold;
        cursor:pointer;
        float: center;
    }

    input#buttonAll:hover, input#buttonAll:focus{
        background: white;
        color:green;
        text-shadow: 3px 1px 5px 4px #F7FE2E;
        box-shadow: 0px 5px 5px 5px #4C6;
        font-weight:bold;
    }
</style>

<openmrs:require privilege="Manage Radiology" otherwise="/login.htm" redirect="/module/radiology/radiologyCustomFormList.form" />


<script type="text/javascript">
    jQuery(document).ready(function()
    {
        jQuery("#myTable").tablesorter({sortList: [[0, 0]]});
        //alert(replaceAllInvalidCharacter("hello this my test of & &"));
    }
    );


    function replaceAllInvalidCharacter(elementValue) {
        // var elementValue = document.getElementById("textArea").innerHTML;
        //var elementValue = "hello this my test of &";
        alert(elementValue);
        if (elementValue.contains("&")) {
            var replacemetValue = elementValue.replaceAll("&", "(AND)");
            return replacemetValue
        } else {
            return elementValue;
        }
    }
    String.prototype.replaceAll = function(target, replacement) {
        return this.split(target).join(replacement);
    };
	
	
	  function submitForm() {
        jQuery("#radiologyFormList").ajaxSubmit(
                {
                    success: function(responseText, statusText, xhr) {
                        alert("success");
                    },
                    error: function() {
                        alert("error");
                    }
                });

    }
	function doDelete(){
		var dd=jQuery("#singledata").text();
		alert(dd);
	}
	

</script>
<div class="formStyle">
    <h1>Radiology Custom Template List</h1>
    <br />
    <a href="editRadiologyCustomForm.form" id="buttonAll" class="styleButton">Add new form</a>
    <form  id="radiologyFormList" action="deleteRadiologyFile.form" method="POST">
        <table id="myTable" class="tablesorter">
            <thead>
                <tr>			
                    <th width="70%;">Name</th>			

                    <th width="30%;"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="form" items="${forms}" varStatus="index">
                    <tr class="${klass}">				
                        
                           <td>
                        <a href="editRadiologyCustomForm.form?conceptName=${form.conceptName}" id="singledata" onClick="doDelete()">${form.conceptName}</a>
						        
                         </td>
                    			                    
	
                        <td>
						<a href="#" onClick="doDelete()">${form.conceptName}</a>
                            <input type="button" value="Delete" onClick="doDelete()"  class="styleButton" id="buttonAll"/>
                            
                        </td>				

                        <td>	          
                            <input type="button" value="Preview" onClick="doPreview()"  class="styleButton" id="buttonAll"/>
                        </td>
					
                    </tr>	
                </c:forEach>
				
            </tbody>

        </table>
    </form>
</div>
<%@ include file="/WEB-INF/template/footer.jsp" %>  