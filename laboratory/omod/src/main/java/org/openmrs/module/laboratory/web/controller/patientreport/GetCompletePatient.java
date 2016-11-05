/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.laboratory.web.controller.patientreport;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.model.LabTest;
import org.openmrs.module.laboratory.LaboratoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Khairul
 */
@Controller("GetCompletePatientController")
public class GetCompletePatient {

    @RequestMapping(value = "/module/laboratory/completeTestAll.htm", method = RequestMethod.GET)
    public String getCompletedTest(@RequestParam(value = "date", required = false) String date,
            Model model) throws ParseException {
        LaboratoryService ls = (LaboratoryService) Context.getService(LaboratoryService.class);

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        Date date1 = null;
        try {
            date1 = sdf.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        List<LabTest> listComTest = ls.getLaboratoryTestsByDateAndAccepted(date1);
        model.addAttribute("listComTest", listComTest);
  
        List < String > conName = new ArrayList<String>();
        for (int i = 0; i < listComTest.size(); i++) { //using loop 
            String conceptName = listComTest.get(i).getConcept().getName().getName();
            conName.add(conceptName);
        }
        model.addAttribute("conName", conName);
        return "/module/laboratory/patientreport/completeTestAll";
    }
}
