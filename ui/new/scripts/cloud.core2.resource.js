function afterLoadResourceJSP() {
    var $rightPanelHeaderLabel = $("#right_panel_header").find("#label");

    var $rightPanelConent = $("#right_panel_content");
    var $zonePage = $rightPanelConent.find("#zone_page");
    var $podPage = $rightPanelConent.find("#pod_page");
    var $clusterPage = $rightPanelConent.find("#cluster_page");
    var $hostPage = $rightPanelConent.find("#host_page");
    var $primarystoragePage = $rightPanelConent.find("#primarystorage_page");
    var $systemvmPage = $rightPanelConent.find("#systemvm_page");
    
    var pageArray = [$zonePage, $podPage, $clusterPage, $hostPage, $primarystoragePage, $systemvmPage];
    var pageLabelArray = ["Zone", "Pod", "Cluster", "Host", "Primary Storage", "System VM"];
    
    function showPage($pageToShow) {        
        for(var i=0; i<pageArray.length; i++) {
            if(pageArray[i].attr("id") == $pageToShow.attr("id")) {
                $rightPanelHeaderLabel.text(pageLabelArray[i]);
                pageArray[i].show();
            }
            else {
                pageArray[i].hide();
            }
        }            
    }
   
    //***** build zone tree (begin) ***********************************************************************************************
    var forceLogout = true;  // We force a logout only if the user has first added a POD for the very first time 
    var $zoneetree1 = $("#zonetree").clone().attr("id", "zonetree1");  
    $("#midmenu_container").append($zoneetree1.show());
    
    $.ajax({
	    data: createURL("command=listZones&available=true"+maxPageSize),
		dataType: "json",
		success: function(json) {
			var items = json.listzonesresponse.zone;
			var container = $("#zonetree1").find("#zones_container").empty();
			if (items != null && items.length > 0) {					    
				for (var i = 0; i < items.length; i++) {
					var template = $("#zone_template").clone(true).attr("id", "zone_"+items[i].id);
					zoneJSONToTreeNode(items[i], template);
					container.append(template.show());
				}
			}
		}
	});  

    function zoneJSONToTreeNode(json, template) {
        var zoneid = json.id;
        template.attr("id", "zone_" + zoneid);  
	    template.data("id", zoneid).data("name", fromdb(json.name));
	    var zoneName = template.find("#zone_name").text(fromdb(json.name));
	    zoneName.data("id", zoneid);	
		zoneName.data("name", fromdb(json.name));
		zoneName.data("dns1", json.dns1)
		zoneName.data("internaldns1", json.internaldns1)
		zoneName.data("guestcidraddress", json.guestcidraddress);		
	    if (json.dns2 != null) 
		    zoneName.data("dns2", json.dns2);	
	    if (json.internaldns2 != null) 
		    zoneName.data("internaldns2", json.internaldns2);	
	    if (json.vlan != null) 
		    zoneName.data("vlan", json.vlan);		
    	
	    $.ajax({
	        data: createURL("command=listPods&zoneid="+zoneid+maxPageSize),
		    dataType: "json",
		    success: function(json) {
			    var items = json.listpodsresponse.pod;
			    var container = template.find("#pods_container").empty();
			    if (items != null && items.length > 0) {					    
				    for (var i = 0; i < items.length; i++) {
					    var podTemplate = $("#pod_template").clone(true).attr("id", "pod_"+items[i].id);
					    podJSONToTreeNode(items[i], podTemplate);
					    container.append(podTemplate.show());
					    forceLogout = false;  // We don't force a logout if pod(s) exit.
				    }
			    }
		    }
	    });
	    	    
	    $.ajax({
	        data: createURL("command=listSystemVms&zoneid="+zoneid+maxPageSize),
		    dataType: "json",
		    success: function(json) {
			    var items = json.listsystemvmsresponse.systemvm;
			    var container = template.find("#systemvms_container").empty();
			    if (items != null && items.length > 0) {					    
				    for (var i = 0; i < items.length; i++) {
					    var systemvmTemplate = $("#systemvm_template").clone(true).attr("id", "systemvm_"+items[i].id);
					    systemvmJSONToTreeNode(items[i], systemvmTemplate);
					    container.append(systemvmTemplate.show());
				    }
			    }
		    }
	    });
    }
    
    function podJSONToTreeNode(json, template) {	
        var podid = json.id;
        template.attr("id", "pod_" + podid);  
    	    
		var ipRange = getIpRange(json.startip, json.endip);			
		template.data("id", podid).data("name", json.name);
		
		var podName = template.find("#pod_name").text(json.name);
		podName.data("id", podid);
		podName.data("zoneid", json.zoneid);
		podName.data("name", json.name);
		podName.data("cidr", json.cidr);
		podName.data("startip", json.startip);
		podName.data("endip", json.endip);
		podName.data("ipRange", ipRange);		
		podName.data("gateway", json.gateway);		
		
	    $.ajax({
            data: createURL("command=listClusters&podid="+podid+maxPageSize),
	        dataType: "json",
	        success: function(json) {
		        var items = json.listclustersresponse.cluster;
		        var container = template.find("#clusters_container").empty();
		        if (items != null && items.length > 0) {					    
			        for (var i = 0; i < items.length; i++) {
				        var clusterTemplate = $("#cluster_template").clone(true).attr("id", "cluster_"+items[i].id);
				        clusterJSONToTreeNode(items[i], clusterTemplate);
				        container.append(clusterTemplate.show());
			        }
		        }
	        }
        });		
	}
		
	function systemvmJSONToTreeNode(json, template) {	
	    var systemvmid = json.id;	
	    template.attr("id", "systemvm_"+systemvmid);
	    template.data("id", systemvmid).data("name", json.name);	     
	    var systeymvmName = template.find("#systemvm_name").text(json.name);
		systeymvmName.data("state", json.state);	
		systeymvmName.data("systemvmtype", json.systemvmtype);
		systeymvmName.data("zonename", fromdb(json.zonename));
		systeymvmName.data("id", json.id);		
		systeymvmName.data("name", fromdb(json.name));	
		systeymvmName.data("activeviewersessions", json.activeviewersessions);	
		systeymvmName.data("publicip", json.publicip);
		systeymvmName.data("privateip", json.privateip);
		systeymvmName.data("hostname", fromdb(json.hostname));
		systeymvmName.data("gateway", json.gateway);	
		systeymvmName.data("created", json.created);		
	}
			
	function clusterJSONToTreeNode(json, template) {
	    template.data("id", json.id).data("name", fromdb(json.name));
	    
	    var systeymvmName = template.find("#cluster_name").text(fromdb(json.name));
	    	   
	    $.ajax({
            data: createURL("command=listHosts&clusterid="+json.id+maxPageSize),
	        dataType: "json",
	        success: function(json) {
		        var items = json.listhostsresponse.host;
		        var container = template.find("#hosts_container").empty();
		        if (items != null && items.length > 0) {					    
			        for (var i = 0; i < items.length; i++) {
				        var hostTemplate = $("#host_template").clone(true).attr("id", "host_"+items[i].id);
				        hostJSONToTreeNode(items[i], hostTemplate);
				        container.append(hostTemplate.show());
			        }
		        }
	        }
        });		
        
        $.ajax({
            data: createURL("command=listStoragePools&clusterid="+json.id+maxPageSize),
	        dataType: "json",
	        success: function(json) {
		        var items = json.liststoragepoolsresponse.storagepool;
		        var container = template.find("#primarystorages_container").empty();
		        if (items != null && items.length > 0) {					    
			        for (var i = 0; i < items.length; i++) {
				        var primaryStorageTemplate = $("#primarystorage_template").clone(true).attr("id", "primary_storage_"+items[i].id);
				        primaryStorageJSONToTreeNode(items[i], primaryStorageTemplate);
				        container.append(primaryStorageTemplate.show());
			        }
		        }
	        }
        });		    
	}
	
	function hostJSONToTreeNode(json, template) {
	    template.data("id", json.id).data("name", fromdb(json.name));
	    
	    var hostName = template.find("#host_name").text(fromdb(json.name));
	}
	
	function primaryStorageJSONToTreeNode(json, template) {
	    template.data("id", json.id).data("name", fromdb(json.name));
	    
	    var primaryStorageName = template.find("#primarystorage_name").text(fromdb(json.name));
	}
	
	$("#zone_template").bind("click", function(event) {
		var template = $(this);
		var target = $(event.target);
		var action = target.attr("id");
		var id = template.data("id");
		var name = template.data("name");
		
		switch (action) {
			case "zone_expand" :			   
				if (target.hasClass("zonetree_closedarrows")) {						
					target.removeClass().addClass("zonetree_openarrows");					
					target.parent().parent().parent().find("#zone_content").show();	
				} else {					
					target.removeClass().addClass("zonetree_closedarrows");					
					target.parent().parent().parent().find("#zone_content").hide();									
				}
				break;	
			case "zone_name":	
			    $zoneetree1.find(".selected").removeClass("selected");
			    target.parent().parent().parent().addClass("selected");				    
			    showPage($zonePage);	    
			    var obj = {"id": target.data("id"), "name": target.data("name"), "dns1": target.data("dns1"), "dns2": target.data("dns2"), "internaldns1": target.data("internaldns1"), "internaldns2": target.data("internaldns2"), "vlan": target.data("vlan"), "guestcidraddress": target.data("guestcidraddress")};
				zoneJsonToDetailsTab(obj);							    		   			    
			    break;
			
			
			case "pod_expand" :				    	   
				if (target.hasClass("zonetree_closedarrows")) {									
					target.removeClass().addClass("zonetree_openarrows");
					target.parent().parent().siblings("#pod_content").show();	
				} else {					
					target.removeClass().addClass("zonetree_closedarrows");
					target.parent().parent().siblings("#pod_content").hide();
				}
				break;	
			case "pod_name" :			   
				$zoneetree1.find(".selected").removeClass("selected");
				target.parent().parent().parent().addClass("selected");
				showPage($podPage);
			    var obj = {"id": target.data("id"), "zoneid": target.data("zoneid"), "name": target.data("name"), "cidr": target.data("cidr"), "startip": target.data("startip"), "endip": target.data("endip"), "ipRange": target.data("ipRange"), "gateway": target.data("gateway")};
				podJsonToDetailsTab(obj);				
				break;
				
			
			case "cluster_expand" :			   
				if (target.hasClass("zonetree_closedarrows")) {
				    target.removeClass().addClass("zonetree_openarrows");
					target.parent().parent().siblings("#cluster_content").show();					
					
				} else {
				    target.removeClass().addClass("zonetree_closedarrows");
					target.parent().parent().siblings("#cluster_content").hide();					
				}
				break;		
			case "cluster_name" :			   
				$zoneetree1.find(".selected").removeClass("selected");
			    target.parent().parent().parent().addClass("selected");
			    showPage($clusterPage);
			    //var obj = {"id": target.data("id"), "zoneid": target.data("zoneid"), "name": target.data("name"), "cidr": target.data("cidr"), "startip": target.data("startip"), "endip": target.data("endip"), "ipRange": target.data("ipRange"), "gateway": target.data("gateway")};
				//clusterObjectToRightPanel(obj);				
				break;	
				
				
			case "host_expand" :			   
				if (target.hasClass("zonetree_closedarrows")) {
				    target.removeClass().addClass("zonetree_openarrows");
					target.parent().parent().siblings("#host_content").show();					
					
				} else {
				    target.removeClass().addClass("zonetree_closedarrows");
					target.parent().parent().siblings("#host_content").hide();					
				}
				break;	
			case "host_name" :			   
				$zoneetree1.find(".selected").removeClass("selected");
			    target.parent().parent().parent().addClass("selected");
			    showPage($hostPage);
				//var obj = {"id": target.data("id"), "zoneid": target.data("zoneid"), "name": target.data("name"), "cidr": target.data("cidr"), "startip": target.data("startip"), "endip": target.data("endip"), "ipRange": target.data("ipRange"), "gateway": target.data("gateway")};
				//hostObjectToRightPanel(obj);				
				break;	
			
			
			case "primarystorage_expand" :			   
				if (target.hasClass("zonetree_closedarrows")) {
				    target.removeClass().addClass("zonetree_openarrows");
					target.parent().parent().siblings("#primarystorage_content").show();					
					
				} else {
				    target.removeClass().addClass("zonetree_closedarrows");
					target.parent().parent().siblings("#primarystorage_content").hide();					
				}
				break;	
			case "primarystorage_name" :			   
				$zoneetree1.find(".selected").removeClass("selected");
			    target.parent().parent().parent().addClass("selected");
			    showPage($primarystoragePage);
				//var obj = {"id": target.data("id"), "zoneid": target.data("zoneid"), "name": target.data("name"), "cidr": target.data("cidr"), "startip": target.data("startip"), "endip": target.data("endip"), "ipRange": target.data("ipRange"), "gateway": target.data("gateway")};
				//primarystorageObjectToRightPanel(obj);				
				break;
						
						
			case "systemvm_name" :			   
				$zoneetree1.find(".selected").removeClass("selected");			    		    
			    target.parent().parent().parent().addClass("selected");		
			    showPage($systemvmPage);
				var obj = {
	                "id": target.data("id"),
	                "name": target.data("name"),
	                "systemvmtype": target.data("systemvmtype"),
	                "zonename": target.data("zonename"),
	                "activeviewersessions": target.data("activeviewersessions"),
	                "publicip": target.data("publicip"),
	                "privateip": target.data("privateip"),
	                "hostname": target.data("hostname"),
	                "gateway": target.data("gateway"),
	                "created": target.data("created"),
	                "state": target.data("state")
	            };				
				systemvmJsonToDetailsTab(obj);			
				break;
			
			
			default:
				break;
		}
		return false;
	});
    
    function getIpRange(startip, endip) {
	    var ipRange = "";
		if (startip != null && startip.length > 0) {
			ipRange = startip;
		}
		if (endip != null && endip.length > 0) {
			ipRange = ipRange + " - " + endip;
		}		
		return ipRange;
	}		
	//***** build zone tree (end) *************************************************************************************************
	
	//***** zone page (begin) *****************************************************************************************************
	//switch between different tabs in zone page 
    var tabArray = [$zonePage.find("#tab_details"), $zonePage.find("#tab_network"), $zonePage.find("#tab_secondary_storage")];
    var tabContentArray = [$zonePage.find("#tab_content_details"), $zonePage.find("#tab_content_network"), $zonePage.find("#tab_content_secondary_storage")];
    switchBetweenDifferentTabs(tabArray, tabContentArray);       
  
    function zoneJsonToDetailsTab(jsonObj) {	    
	    var $detailsTab = $zonePage.find("#tab_content_details");   
        $detailsTab.data("jsonObj", jsonObj);           
        $detailsTab.find("#id").text(fromdb(jsonObj.id));
        $detailsTab.find("#name").text(fromdb(jsonObj.name));
        $detailsTab.find("#dns1").text(fromdb(jsonObj.dns1));
        $detailsTab.find("#dns2").text(fromdb(jsonObj.dns2));
        $detailsTab.find("#internaldns1").text(fromdb(jsonObj.internaldns1));
        $detailsTab.find("#internaldns2").text(fromdb(jsonObj.internaldns2));	
        $detailsTab.find("#vlan").text(fromdb(jsonObj.vlan));
        $detailsTab.find("#guestcidraddress").text(fromdb(jsonObj.guestcidraddress));     
	}	  
    //***** zone page (end) *******************************************************************************************************
    
    //***** pod page (begin) ******************************************************************************************************
    function podJsonToDetailsTab(jsonObj) {	    
	    var $detailsTab = $podPage.find("#tab_content_details");   
        $detailsTab.data("jsonObj", jsonObj);           
        $detailsTab.find("#id").text(fromdb(jsonObj.id));
        $detailsTab.find("#name").text(fromdb(jsonObj.name));
        $detailsTab.find("#cidr").text(fromdb(jsonObj.cidr));        
        $detailsTab.find("#ipRange").text(fromdb(jsonObj.ipRange));
        $detailsTab.find("#gateway").text(fromdb(jsonObj.gateway));  
        
        //if (getDirectAttachUntaggedEnabled() == "true") 
		//	$("#submenu_content_zones #action_add_directip_vlan").data("type", "pod").data("id", obj.id).data("name", obj.name).data("zoneid", obj.zoneid).show();		
	}	
	//***** pod page (end) ********************************************************************************************************
	
	//***** systemVM page (begin) *************************************************************************************************
    function systemvmJsonToDetailsTab(jsonObj) {	   
	    var $detailsTab = $systemvmPage.find("#tab_content_details");   
        $detailsTab.data("jsonObj", jsonObj);   
        
        $detailsTab.find("#state").text(fromdb(jsonObj.state));     
        $detailsTab.find("#systemvmtype").text(toSystemVMTypeText(jsonObj.systemvmtype));    
        $detailsTab.find("#zonename").text(fromdb(jsonObj.zonename)); 
        $detailsTab.find("#id").text(fromdb(jsonObj.id));  
        $detailsTab.find("#name").text(fromdb(jsonObj.name));   
        $detailsTab.find("#activeviewersessions").text(fromdb(jsonObj.activeviewersessions)); 
        $detailsTab.find("#publicip").text(fromdb(jsonObj.publicip)); 
        $detailsTab.find("#privateip").text(fromdb(jsonObj.privateip)); 
        $detailsTab.find("#hostname").text(fromdb(jsonObj.hostname));
        $detailsTab.find("#gateway").text(fromdb(jsonObj.gateway)); 
        $detailsTab.find("#created").text(fromdb(jsonObj.created));             
	}
	
	function toSystemVMTypeText(value) {
	    var text = "";
        if(value == "consoleproxy")
            text = "Console Proxy VM";
        else if(value == "secondarystoragevm")
            text = "Secondary Storage VM";
        return text;        
    }
	//***** systemVM page (end) ***************************************************************************************************
}
