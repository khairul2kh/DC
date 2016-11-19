<%-- 
    Document   : biochemistry
    Created on : Nov 5, 2016, 11:25:59 AM
    Author     : Khairul
--%>

<!-- CBC -->
<c:forEach items="${te}" var="te">
    <c:if test="${investigation eq '2410' && te.concept.conceptId eq '2410' }">

        <tr>
            <td style="width:35%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '995' && t.groupName eq '2410'}">
                        &nbsp;&nbsp;${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="right" style="padding-left:0px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '995' && t.groupName eq '2410'}">
                        <b> ${t.test}  </b>
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:0px; width:15%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '995' && t.groupName eq '2410'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="right">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '995' && t.groupName eq '2410'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2220' && t.groupName eq '2410'}">
                        &nbsp;&nbsp;${t.testName}   
                    </c:if>	 
                </c:forEach>
            </td>
            <td align="right" style="padding-left:0px; width:5%;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2220' && t.groupName eq '2410'}">
                        <b> ${t.test}  </b>  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:0px; width:15%;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2220' && t.groupName eq '2410'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="right">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '2220' && t.groupName eq '2410'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if> 
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td colspan="4"> &nbsp;&nbsp;<u style="font-weight:bold;">Total Count</u>
    </td>
</tr>
<tr>
    <td style="vertical-align: top;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2211'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}    
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">   
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2211'}">
                <b> ${t.test}  </b>  
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2211'}">
                ${t.unit}  
            </c:if>
        </c:forEach> 
    </td>
    <td align="right">    
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2211'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr>
    <td style="vertical-align: top;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '4570'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}    
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">   
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '4570'}">
                <b> ${t.test}  </b> 
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '4570'}">
                ${t.unit}  
            </c:if>
        </c:forEach> 
    </td>
    <td align="right">   
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '4570'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr>
    <td style="vertical-align: top;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '4242'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}    
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">   
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '4242'}">
                <b> ${t.test}  </b>
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '4242'}">
                ${t.unit}  
            </c:if>
        </c:forEach> 
    </td>
    <td align="right">   
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '4242'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>

<tr>
    <td colspan="4"> &nbsp;&nbsp;<u style="font-weight:bold;">Differential Count</u>
</td>
</tr>
<tr>
    <td style="vertical-align: top;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2237'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}    
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">   
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2237'}">
                <b> ${t.test}  </b> 
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2237'}">
                ${t.unit}  
            </c:if>
        </c:forEach> 
    </td>
    <td align="right">    
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2237'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr>
    <td style="vertical-align: top;">
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2238'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}  
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2238'}">
                <b> ${t.test}  </b> 
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2238'}">
                ${t.unit}   
            </c:if>
        </c:forEach> 
    </td>
    <td align="right"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2238'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr>
    <td style="vertical-align: top;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2239'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}   
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2239'}">
                <b> ${t.test}  </b>  
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2239'}">
                ${t.unit}  
            </c:if>
        </c:forEach> 
    </td>
    <td align="right">  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2239'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr>
    <td style="vertical-align: top;">
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2240'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}  
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2240'}">
                <b> ${t.test}  </b>
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2240'}">
                ${t.unit}  
            </c:if>
        </c:forEach> 
    </td>
    <td align="right"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2240'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr>
    <td  style="vertical-align: top;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2241'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}   
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">   
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2241'}">
                <b> ${t.test}  </b> 
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2241'}">
                ${t.unit}   
            </c:if>
        </c:forEach> 
    </td>
    <td align="right"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '2241'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>

<tr>
    <td colspan="4"> &nbsp;&nbsp;<u style="font-weight:bold;">Red Cell Indices</u>
</td>
</tr>
<tr>
    <td style="vertical-align: top;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6773'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}    
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">   
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6773'}">
                <b> ${t.test}  </b> 
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6773'}">
                ${t.unit}  
            </c:if>
        </c:forEach> 
    </td>
    <td align="right">
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6773'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr>
    <td style="vertical-align: top;">
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6774'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}  
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6774'}">
                <b> ${t.test}  </b>
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6774'}">
                ${t.unit}   
            </c:if>
        </c:forEach> 
    </td>
    <td align="right">  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6774'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr>
    <td style="vertical-align: top;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6775'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}   
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6775'}">
                <b> ${t.test}  </b>  
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6775'}">
                ${t.unit}  
            </c:if>
        </c:forEach> 
    </td>
    <td align="right"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6775'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr>
    <td style="vertical-align: top;">
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6776'}">
                &emsp;&emsp;&emsp;&emsp;&nbsp;${t.testName}  
            </c:if>	 
        </c:forEach>
    </td> 
    <td align="right" style="padding-left:0px; width:5%;">  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6776'}">
                <b> ${t.test}  </b>
            </c:if>
        </c:forEach> 
    </td>
    <td>  
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6776'}">
                ${t.unit}  
            </c:if>
        </c:forEach> 
    </td>
    <td align="right">
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6776'}">
                <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
            </c:if>
        </c:forEach> 
    </td>
</tr>

</c:if>
</c:forEach>

<!-- S. Electrolytes -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '2543' && te.concept.conceptId eq '2543' }">
        <tr> <td colspan="4">&nbsp;&nbsp;<b>S. Electrolytes</b> </td> </tr>	
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5187'}">
                        &emsp;&emsp;&nbsp;${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:0px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5187'}">
                        <b> ${t.value}  </b>
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:0px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5187'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:3px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5187'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5188'}">
                        &emsp;&emsp;&nbsp;${t.testName}  
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:0px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5188'}">
                       <b> ${t.value}  </b>
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:0px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5188'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:3px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5188'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5189'}">
                        &emsp;&emsp;&nbsp;${t.testName} 
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:0px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5189'}">
                        <b> ${t.value}  </b>  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:0px;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5189'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:3px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5189'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
        <tr>
            <td> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5190'}">
                        &emsp;&emsp;&nbsp;${t.testName} 
                    </c:if>	 
                </c:forEach>
            </td>
            <td style="padding-left:0px; width:15%;"> 
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5190'}">
                        <b> ${t.value}  </b>  
                    </c:if>
                </c:forEach> 
            </td>
            <td style="padding-left:0px;">  
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5190'}">
                        ${t.unit}  
                    </c:if>
                </c:forEach> 
            </td>
            <td align="left" style="padding-left:3px;">
                <c:forEach items="${tmn}" var="t">
                    <c:if test="${t.investigation eq '5190'}">
                        <c:if test="${not empty t.refRange}"> ${t.refRange} </c:if>
                        <c:if test="${empty t.refRange}"> ${t.lowNormal} -  ${t.hiNormal} </c:if>
                    </c:if>
                </c:forEach> 
            </td>
        </tr>
    </c:if>
</c:forEach>

<!-- Mantrux Test (MT) -->
<c:forEach items="${te}" var="te">  
    <c:if test="${investigation eq '5718' && te.concept.conceptId eq '5718' }">
        <tr style="border:none;"><td colspan="4">&nbsp;</td> </tr>
        <tr align="center"> <td colspan="4"> <u style="font-weight:bold; font-size:17px;"> TUBERCULIN TEST REPORT </u> </td> </tr>	
<tr> <td colspan="4">&nbsp;</td> </tr>

<tr style="line-height:200%;">
    <td width="6%"> &nbsp; </td>
    <td ><b style="font-size:15px;"> Site of injection </b></td>
    <td width="2%"> : </td>
    <td style="padding-left:20px;" >  Medial aspect of forearm  </td> 
</tr>

<tr style="line-height:200%;">
    <td width="6%"> &nbsp; </td>  
    <td> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '5885' && t.groupName eq '5718'}">
                <b style="font-size:15px;">  ${t.testName}  </b>
            </c:if>	 
        </c:forEach>
    </td>
    <td width="2%"> : </td>
    <td style="padding-left:20px;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '5885' && t.groupName eq '5718'}">
                <b> ${t.value}  </b>  
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr style="line-height:200%;">
    <td width="6%"> &nbsp; </td>
    <td ><b style="font-size:15px;"> Dose </b> </td>
    <td width="2%"> : </td>
    <td style="padding-left:20px;" > <span style="font-size:15px;"> 10 TU of PPD  </span></td> 
</tr>
<tr style="line-height:200%;">
    <td width="6%"> &nbsp; </td> 
    <td> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '5886' && t.groupName eq '5718'}">
                <b style="font-size:15px;"> ${t.testName} </b> 
            </c:if>	 
        </c:forEach>
    </td>
    <td width="2%"> : </td>
    <td style="padding-left:20px;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '5886' && t.groupName eq '5718'}">
                <b> ${t.value}  </b>  
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr style="line-height:200%;">
    <td width="10%"> &nbsp; </td>  
    <td> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '5887' && t.groupName eq '5718'}">
                <b style="font-size:15px;">  ${t.testName}  </b>
            </c:if>	 
        </c:forEach>
    </td>
    <td width="2%"> : </td>
    <td style="padding-left:20px;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '5887' && t.groupName eq '5718'}">
                <b> ${t.value}  </b>  
            </c:if>
        </c:forEach> 
    </td>
</tr>
<tr style="line-height:200%;">
    <td width="10%"> &nbsp; </td> 
    <td> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6712' && t.groupName eq '5718'}">
                <b style="font-size:15px;"> ${t.testName}  </b>
            </c:if>	 
        </c:forEach>
    </td>
    <td width="2%"> : </td>
    <td style="padding-left:20px;"> 
        <c:forEach items="${tmn}" var="t">
            <c:if test="${t.investigation eq '6712' && t.groupName eq '5718'}">
                <b> ${t.value}  </b>  
            </c:if>
        </c:forEach> 
    </td>
</tr>
</c:if>
</c:forEach>

<style> 
    table.report {
        font-family:arial;
        background-color: #CDCDCD;
        margin:10px 0pt 15px;
        font-size: 8pt;
        width: 100%;
        text-align: center;
    }
    table.report thead tr th, table.report tfoot tr th {
        background-color: #e6EEEE;
        border: 1px solid #FFF;
        font-size: 8pt;
        padding: 4px;
    }
    table.report thead tr .header {
        background-image: url(bg.gif);
        background-repeat: no-repeat;
        background-position: center right;
        cursor: pointer;
    }
    table.report tbody td {
        color: #3D3D3D;
        padding: 4px;
        background-color: #FFF;
        vertical-align: top;
    }
    table.report tbody tr.odd td {
        background-color:#F0F0F6;
    }
    table.report thead tr .headerSortUp {
        background-image: url(asc.gif);
    }
    table.report thead tr .headerSortDown {
        background-image: url(desc.gif);
    }
    table.report thead tr .headerSortDown, table.report thead tr .headerSortUp {
        background-color: #8dbdd8;
    }
</style>
