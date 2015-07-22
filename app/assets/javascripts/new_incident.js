var ready;
ready = function() {
      function getSelectValues(select_box, text_box) {
        var values = [];
        var options = select_box.options;
        var option;
        
        for (var i = 0; i < options.length; i++) {
            option = options[i];
            
            if (option.selected) {
                values.push(option.value);
            }
        }
        
        text_box.value = values.join("\n");
    }
    
    var from_selectbox = document.getElementById("from");
    var from_textbox = document.getElementById("incident_from");
    
    var to_selectbox = document.getElementById("to");
    var to_textbox = document.getElementById("incident_to");
    
    var affected_selectbox = document.getElementById("affected_departments");
    var affected_textbox = document.getElementById("incident_affected_departments");
    
    var impact_selectbox = document.getElementsByName("service_impact[]")[0];
    var impact_selectbox2 = document.getElementsByName("service_impact[]")[1];
    var impact_textbox = document.getElementById("incident_service_impact");
    
    var group_selectbox = document.getElementById("responsible_service_support_resource_group");
    var group_textbox = document.getElementById("incident_responsible_service_support_resource_group");
    
    var responsibility_selectbox = document.getElementById("incident_responsibility");
    var responsibility_textbox = document.getElementById("incident_incident_responsibility"); 
    
    from_selectbox.addEventListener("change", function() {
        getSelectValues(from_selectbox, from_textbox);
    });
    
    to_selectbox.addEventListener("change", function() {
        getSelectValues(to_selectbox, to_textbox);
    });
    
    affected_selectbox.addEventListener("change", function() {
        getSelectValues(affected_selectbox, affected_textbox);
    });
    
    impact_selectbox.addEventListener("change", function() {
        getSelectValues(impact_selectbox, impact_textbox);
    });
    
    impact_selectbox2.addEventListener("change", function() {
        getSelectValues(impact_selectbox2, impact_textbox);
    });
    
    group_selectbox.addEventListener("change", function() {
        getSelectValues(group_selectbox, group_textbox);
    });
    
    responsibility_selectbox.addEventListener("change", function() {
        getSelectValues(responsibility_selectbox, responsibility_textbox);
    });
};

$(document).ready(ready);
$(document).on('page:load', ready);

