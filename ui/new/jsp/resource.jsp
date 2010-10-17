<%@ page import="java.util.*" %>

<%@ page import="com.cloud.utils.*" %>

<%
    Locale browserLocale = request.getLocale();
    CloudResourceBundle t = CloudResourceBundle.getBundle("resources/resource", browserLocale);
%>
<!-- domain detail panel (begin) -->
<div class="main_title" id="right_panel_header">
    <!--  
    <div class="main_titleicon">
        <img src="images/title_snapshoticon.gif" alt="Instance" /></div>
    -->
    <h1 id="label">        
    </h1>
</div>
<div class="contentbox" id="right_panel_content">
    <div class="info_detailbox errorbox" id="after_action_info_container" style="display: none">
        <p id="after_action_info">
        </p>
    </div>
    <div id="zone_page" style="display:none">
        <div class="tabbox" style="margin-top: 15px;">
            <div class="content_tabs on" id="tab_details">
                <%=t.t("details")%></div>
            <div class="content_tabs off" id="tab_network">
                <%=t.t("network")%></div>
            <div class="content_tabs off" id="tab_secondary_storage">
                <%=t.t("secondary.storage")%></div>
        </div>
        <!-- Details tab (start)-->
        <div id="tab_content_details">
            <div class="grid_container">
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("ID")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="id">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("name")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="name">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("dns1")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="dns1">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("dns2")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="dns2">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("internaldns1")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="internaldns1">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("internaldns2")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="internaldns2">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("vlan")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="vlan">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("guestcidraddress")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="guestcidraddress">
                        </div>
                    </div>
                </div>                
            </div>
        </div>
        <!-- Details tab (end)-->
        <!-- Network tab (start)-->
        <div style="display: none;" id="tab_content_network">
            <div class="text_container">
                <div class="network_dgbox">
                    <div class="networkdg_zonepanel">
                        <div class="networkdg_zonebox">
                            <div class="networkdg_zonecloud" id="zone_cloud">
                                <p>
                                    <%=t.t("zone")%> <span id="zone_name"></span></p>
                            </div>
                            <div class="networkdg_zoneconnect">
                            </div>
                        </div>
                        <div class="networkswitchpanel">
                            <div class="networkswitch_titlebox">
                                <p>
                                    Guest VLAN <span id="zone_vlan"></span></p>
                            </div>
                            <div class="networkswitch_top">
                            </div>
                            <div class="networkswitch_midpanel" id="vlan_container">                                
                            </div>
                            <div class="networkswitch_end">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Network tab (end)-->
        <!-- Secondary Storage tab (start)-->
        <div id="tab_content_secondary_storage" style="display: none">
            Secondary Storage
        </div>
        <!-- Secondary Storage tab (end)-->
    </div>
    <div id="pod_page" style="display:none">        
        <div class="tabbox" style="margin-top: 15px;">
            <div class="content_tabs on" id="tab_details">
                <%=t.t("details")%></div>           
        </div>
        <!-- Details tab (start)-->
        <div id="tab_content_details">
            <div class="grid_container">
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("ID")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="id">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("name")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="name">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("private.cidr")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="cidr">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("private.ip.range")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="ipRange">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("gateway")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="gateway">
                        </div>
                    </div>
                </div> 
                          
            </div>
        </div>
        <!-- Details tab (end)-->
    </div>
    <div id="cluster_page" style="display:none">
        <div class="tabbox" style="margin-top: 15px;">
            <div class="content_tabs on" id="tab_details">
                <%=t.t("details")%></div>           
        </div>
        <!-- Details tab (start)-->
        <div id="tab_content_details">
            <div class="grid_container">
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("ID")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="id">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("name")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="name">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("zone")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="zonename">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("pod")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="podname">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Details tab (end)-->
    </div>
    <div id="host_page" style="display:none">
        <div class="tabbox" style="margin-top: 15px;">
            <div class="content_tabs on" id="tab_details">
                <%=t.t("details")%></div>           
        </div>
        <!-- Details tab (start)-->
        <div id="tab_content_details">
            <div class="grid_container">
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("ID")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="id">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("name")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="name">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("state")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="state">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("zone")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="zonename">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("pod")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="podname">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("cluster")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="clustername">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("ip.address")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="ipaddress">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("version")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="version">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("os.preference")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="oscategoryname">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("last.disconnected")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="disconnected">
                        </div>
                    </div>
                </div>                
            </div>
        </div>
        <!-- Details tab (end)-->
    </div>
    <div id="primarystorage_page" style="display:none">
        <div class="tabbox" style="margin-top: 15px;">
            <div class="content_tabs on" id="tab_details">
                <%=t.t("details")%></div>           
        </div>
        <!-- Details tab (start)-->
        <div id="tab_content_details">
            <div class="grid_container">
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("ID")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="id">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("name")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="name">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("zone")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="zonename">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("pod")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="podname">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("cluster")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="clustername">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("type")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="type">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("IP.or.FQDN")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="ipaddress">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("path")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="path">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("disk.total")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="disksizetotal">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("disk.allocated")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="disksizeallocated">
                        </div>
                    </div>
                </div>
                 <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("tags")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="tags">
                        </div>
                    </div>
                </div>                
            </div>
        </div>
        <!-- Details tab (end)-->
    </div>
    <div id="systemvm_page" style="display:none">        
        <div class="tabbox" style="margin-top: 15px;">
            <div class="content_tabs on" id="tab_details">
                <%=t.t("details")%></div>           
        </div>
        <!-- Details tab (start)-->
        <div id="tab_content_details">
            <div class="grid_container">                
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("state")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="state">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("system.vm.type")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="systemvmtype">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("zone")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="zonename">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("ID")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="id">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("name")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="name">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("active.sessions")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="activeviewersessions">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("public.ip")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="publicip">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("private.ip")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="privateip">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("host")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="hostname">
                        </div>
                    </div>
                </div>
                <div class="grid_rows even">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("gateway")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="gateway">
                        </div>
                    </div>
                </div>
                <div class="grid_rows odd">
                    <div class="grid_row_cell" style="width: 20%;">
                        <div class="row_celltitles">
                            <%=t.t("created")%>:</div>
                    </div>
                    <div class="grid_row_cell" style="width: 79%;">
                        <div class="row_celltitles" id="created">
                        </div>
                    </div>
                </div>
                          
            </div>
        </div>
        <!-- Details tab (end)-->
    </div>    
</div>
<!-- domain detail panel (end) -->

<!-- Add Zone Dialog -->
<div id="dialog_add_zone" title="Add Zone" style="display:none">
	<p>Please enter the following info to add a new zone:</p>
	<div class="dialog_formcontent">
		<form action="#" method="post" id="form_acquire">
			<ol>
				<li>
					<label>Name:</label>
					<input class="text" type="text" name="add_zone_name" id="add_zone_name"/>
					<div id="add_zone_name_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li>
					<label>DNS 1:</label>
					<input class="text" type="text" name="add_zone_dns1" id="add_zone_dns1"/>
					<div id="add_zone_dns1_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li>
					<label>DNS 2:</label>
					<input class="text" type="text" name="add_zone_dns2" id="add_zone_dns2"/>
					<div id="add_zone_dns2_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li>
					<label>Internal DNS 1:</label>
					<input class="text" type="text" id="add_zone_internaldns1"/>
					<div id="add_zone_internaldns1_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li>
					<label>Internal DNS 2:</label>
					<input class="text" type="text" id="add_zone_internaldns2"/>
					<div id="add_zone_internaldns2_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li id="add_zone_container">
					<label>Zone VLAN Range:</label>
					<input class="text" style="width:67px" type="text" name="add_zone_startvlan" id="add_zone_startvlan"/><span>-</span>
                    <input class="text" style="width:67px" type="text" name="add_zone_endvlan" id="add_zone_endvlan"/>
					<div id="add_zone_startvlan_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
					<div id="add_zone_endvlan_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li>
					<label for="add_zone_guestcidraddress">Guest CIDR:</label>
					<input class="text" type="text" id="add_zone_guestcidraddress" value="10.1.1.0/24"/>
					<div id="add_zone_guestcidraddress_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
			</ol>
		</form>
	</div>
</div>
<!-- END Add Zone Dialog -->
<!-- Add Pod Dialog -->
<div id="dialog_add_pod" title="Add Pod" style="display:none">
	<p>Add a new pod for zone <b><span id="add_pod_zone_name"></span></b> </p>
	<div class="dialog_formcontent">
		<form action="#" method="post" id="form_acquire">
			<ol>
				<li>
					<label for="user_name" style="width:115px;">Name:</label>
					<input class="text" type="text" name="add_pod_name" id="add_pod_name"/>
					<div id="add_pod_name_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li>
					<label for="add_pod_gateway" style="width:115px;">Gateway:</label>
					<input class="text" type="text" id="add_pod_gateway"/>
					<div id="add_pod_gateway_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li>
					<label for="user_name" style="width:115px;">CIDR:</label>
					<input class="text" type="text" name="add_pod_cidr" id="add_pod_cidr"/>
					<div id="add_pod_cidr_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li>
					<label for="user_name" style="width:115px;">Private IP Range:</label>
					<input class="text" style="width:67px" type="text" name="add_pod_startip" id="add_pod_startip"/><span>-</span>
                    <input class="text" style="width:67px" type="text" name="add_pod_endip" id="add_pod_endip"/>
					<div id="add_pod_startip_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
					<div id="add_pod_endip_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>				
			</ol>
		</form>
	</div>
</div>
<!-- END Add Pod Dialog -->

<!-- Add Host Dialog -->
<div id="dialog_add_host" title="Add Host" style="display:none">
	<p>Add a host for zone <b><span id="zone_name"></span></b>, pod <b><span id="pod_name"></span></b></p>
	<div class="dialog_formcontent">
		<form action="#" method="post" id="form_acquire">
			<ol>				
				<li>
					<label for="host_hostname">Host name:</label>
					<input class="text" type="text" name="host_hostname" id="host_hostname"/>
					<div id="host_hostname_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li>
					<label for="user_name">User name:</label>
					<input class="text" type="text" name="host_username" id="host_username"/>
					<div id="host_username_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li>
					<label for="user_name">Password:</label>
					<input class="text" type="password" name="host_password" id="host_password" AUTOCOMPLETE="off" />
					<div id="host_password_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li id="cluster_options_container">
				    <label>&nbsp;</label><span><u>Cluster Options</u></span>
				</li>
				<li id="new_cluster_radio_container">
				    <label><input type="radio" name="cluster" value="new_cluster_radio" checked />&nbsp;New cluster:</label>
				    <input class="text" type="text" id="new_cluster_name"/>
					<div id="new_cluster_name_errormsg" class="dialog_formcontent_errormsg" style="display:none;" ></div>
				</li>
				<li id="existing_cluster_radio_container">
				    <label><input type="radio" name="cluster" value="existing_cluster_radio" />&nbsp;Join cluster:</label>
				    <select class="select" id="cluster_select"></select>
				</li>
				<li id="no_cluster_radio_container">
				    <label><input type="radio" name="cluster" value="no_cluster_radio" />&nbsp;Standalone</label>
				    <span style="padding-left:20px"></span>
				</li>
			</ol>
		</form>
	</div>
</div>

<!-- Add Primary Storage Dialog -->
<div id="dialog_add_pool" title="Add Primary Storage" style="display: none">
    <p>Add a new Primary Storage for zone <b><span id="zone_name"></span></b>, pod <b><span id="pod_name"></span></b></p>
    <div class="dialog_formcontent">
        <form action="#" method="post" id="form_acquire">
        <ol>            
            <li id="pool_cluster_container">
                <label for="pool_cluster">
                    Cluster:</label>
                <select class="select" id="pool_cluster">                    
                </select>
                <div id="pool_cluster_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
            <li>
                <label for="user_name">Name:</label>
                <input class="text" type="text" name="add_pool_name" id="add_pool_name" />
                <div id="add_pool_name_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
            <li>
                <label for="add_pool_protocol">Protocol:</label>
				<select class="select" id="add_pool_protocol">
                    <option value="nfs">NFS</option>
					<option value="iscsi">ISCSI</option>
                </select>
			</li>
			<li>
				<label for="add_pool_nfs_server">Server:</label>
                <input class="text" type="text" name="add_pool_nfs_server" id="add_pool_nfs_server" />
                <div id="add_pool_nfs_server_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
            <li id="add_pool_path_container">
                <label for="add_pool_path">
                    Path:</label>
                <input class="text" type="text" name="add_pool_path" id="add_pool_path" />
                <div id="add_pool_path_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>            
			<li id="add_pool_iqn_container" style="display:none">
                <label for="add_pool_iqn">
                    Target IQN:</label>
                <input class="text" type="text" name="add_pool_iqn" id="add_pool_iqn" />
                <div id="add_pool_iqn_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
			<li id="add_pool_lun_container" style="display:none">
                <label for="add_pool_lun">
                    LUN #:</label>
                <input class="text" type="text" name="add_pool_lun" id="add_pool_lun" />
                <div id="add_pool_lun_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
            <li id="add_pool_tags_container">
                <label for="add_pool_tags">
                    Tags:</label>
                <input class="text" type="text" id="add_pool_tags" />
                <div id="add_pool_tags_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
        </ol>
        </form>
    </div>
</div>


<!-- Zonetree Template (begin) -->
<div class="zonetree_contentbox" id="zonetree" style="display: none">
    <div id="zones_container">
    </div>
</div>
<!-- Zonetree Template (end) -->
<!-- Zone Template (begin) -->
<div id="zone_template" style="display: none">
    <div class="adding_loading" style="height: 25px; display: none" id="loading_container">
        <div class="adding_animation">
        </div>
        <div class="adding_text">
            Adding a zone &hellip;
        </div>
    </div>
    <div id="row_container">
        <div class="leftmenu_content" id="zone_node">
            <div class="leftmenu_firstindent">
                <div class="zonetree_closedarrows" id="zone_expand">
                </div>
                <div class="leftmenu_list_icons">
                    <img src="images/zone_zoneicon.png" id="zone_icon" alt="Zone" /></div>
                <span id="zone_label">Zone:</span> <strong><span id="zone_name">Zone 1</span> </strong>
            </div>
        </div>
        <div id="zone_content" style="display: none">
            <div id="pods_container">
            </div>
            <div id="systemvms_container">
            </div>
        </div>
    </div>
</div>
<!-- Zone Template (end) -->
<!-- Pod Template (begin) -->
<div id="pod_template" style="display: none">
    <div class="adding_loading" style="height: 25px; display: none" id="loading_container">
        <div class="adding_animation">
        </div>
        <div class="adding_text">
            Adding a pod &hellip;
        </div>
    </div>
    <div id="row_container">
        <div class="leftmenu_content" id="pod_node">
            <div class="leftmenu_secondindent">
                <div class="zonetree_closedarrows" id="pod_expand">
                </div>
                <div class="leftmenu_list_icons">
                    <img src="images/zone_podicon.png" id="pod_icon" alt="Pod" /></div>
                <span id="pod_label">Pod:</span> <strong><span id="pod_name">Name of the Pod</span>
                </strong>
            </div>
        </div>
        <div id="pod_content" style="display: none">
            <div id="clusters_container">
            </div>
        </div>
    </div>
</div>
<!-- Pod Template (end) -->
<!-- Cluster Template (begin) -->
<div id="cluster_template" style="display: none">
    <div class="adding_loading" style="height: 25px; display: none" id="loading_container">
        <div class="adding_animation">
        </div>
        <div class="adding_text">
            Adding a cluster &hellip;
        </div>
    </div>
    <div id="row_container">
        <div class="leftmenu_content" id="cluster_node">
            <div class="leftmenu_thirdindent">
                <div class="zonetree_openarrows" id="cluster_expand">
                </div>
                <div class="leftmenu_list_icons">
                    <img src="images/zone_clustericon.png" id="cluster_icon" alt="Cluster" /></div>
                <span id="cluster_label"">Cluster:</span> <strong><span id="cluster_name">(Name of the
                    Cluster)</span> </strong>
            </div>
        </div>
        <div id="cluster_content">
            <div id="hosts_container">
            </div>
            <div id="primarystorages_container">
            </div>
        </div>
    </div>
</div>
<!-- Cluster Template (end) -->
<!-- Host Template (begin) -->
<div id="host_template" style="display: none">
    <div class="adding_loading" style="height: 25px; display: none" id="loading_container">
        <div class="adding_animation">
        </div>
        <div class="adding_text">
            Adding a host &hellip;
        </div>
    </div>
    <div id="row_container">
        <div class="leftmenu_content" id="host_node">
            <div class="leftmenu_fourthindent">
                <div class="leftmenu_list_icons">
                    <img src="images/zone_hosticon.png" id="host_icon" alt="Host" /></div>
                <span id="host_label">Host:</span> <strong><span id="host_name">(Name of the Host)</span>
                </strong>
            </div>
        </div>
    </div>
</div>
<!-- Host Template (end) -->
<!-- Primary Storage Template (begin) -->
<div id="primarystorage_template" style="display: none">
    <div class="adding_loading" style="height: 25px; display: none" id="loading_container">
        <div class="adding_animation">
        </div>
        <div class="adding_text">
            Adding a primary storage &hellip;
        </div>
    </div>
    <div id="row_container">
        <div class="leftmenu_content" id="primarystorage_node">
            <div class="leftmenu_fourthindent">
                <div class="leftmenu_list_icons">
                    <img src="images/zone_primarystorageicon.png" id="primarystorage_icon" alt="PrimaryStorage" /></div>
                <span id="primarystorage_label">Storage:</span> <strong><span id="primarystorage_name">
                    (Name of the Primary Storage)</span> </strong>
            </div>
        </div>
    </div>
</div>
<!-- Primary Storage Template (end) -->
<!-- SystemVM Template (begin) -->
<div id="systemvm_template" style="display: none">
    <div id="row_container">
        <div class="leftmenu_content" id="systemvm_node">
            <div class="leftmenu_secondindent">
                <div class="leftmenu_list_icons">
                    <img src="images/zone_systemvmicon.png" id="systemvm_icon" alt="System VM" /></div>
                <span id="systemvm_label">System VM:</span> <strong><span id="systemvm_name">(System
                    VM name)</span> </strong>
            </div>
        </div>
    </div>
</div>
<!-- SystemVM Template (end) -->
<!-- Direct VLAN Template (begin) -->
<div class="networkswitch_vlanpanel" id="direct_vlan_template" style="display: none">
    <div class="networkswitch_vlanconnect">
        <div class="networkswitch_vlan_infoicon">
        </div>
        <div class="networkswitch_vlan_detailsbox">
            <div class="networkswitch_vlan_detailsbox_textbox">
                <div class="networkswitch_vlan_detailsbox_textbox_label">
                    VLAN:</div>
                <span id="vlan_id">n</span>
            </div>
            <div class="networkswitch_vlan_detailsbox_textbox">
                <div class="networkswitch_vlan_detailsbox_textbox_label">
                    <%=t.t("ip.address.range")%>:</div>
                <span id="ip_range">n.n.n.n - m.m.m.m</span>
            </div>
        </div>
        <div class="networkswitch_typeicon direct">
        </div>
    </div>
</div>
<!-- Direct VLAN Template (end) -->
<!-- Public VLAN Template (begin) -->
<div class="networkswitch_vlanpanel" id="virtual_vlan_template" style="display: none">
    <div class="networkswitch_vlanconnect">
        <div class="networkswitch_vlan_infoicon">
        </div>
        <div class="networkswitch_vlan_detailsbox">
            <div class="networkswitch_vlan_detailsbox_textbox">
                <div class="networkswitch_vlan_detailsbox_textbox_label">
                    VLAN:</div>
                <span id="vlan_id">n</span>
            </div>
            <div class="networkswitch_vlan_detailsbox_textbox">
                <div class="networkswitch_vlan_detailsbox_textbox_label">
                     <%=t.t("ip.address.range")%>:</div>
                <span id="ip_range">n.n.n.n - m.m.m.m</span>
            </div>
        </div>
        <div class="networkswitch_typeicon virtual">
        </div>
    </div>
</div>
<!-- Public VLAN Template (begin) -->