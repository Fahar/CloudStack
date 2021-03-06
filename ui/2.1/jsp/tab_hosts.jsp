<%@ page import="java.util.Date" %>
<%
long milliseconds = new Date().getTime();
%>
	
<div class="maincontent" id="submenu_content_routing" style="display:block">
	<div id="maincontent_title">
    	<div class="maintitle_icon"> <img src="images/hosttitle_icons.gif" title="host" /> </div>
		<h1>Hosts</h1>
       
		<a class="add_hostbutton" id="host_action_new_routing" href="#" style="display:none"></a>
		<div class="search_formarea">
			<form action="#" method="post">
				<ol>
					<li><input class="text" type="text" name="search_input" id="search_input" /></li>
				</ol>
			</form>
			<a class="search_button" id="search_button" href="#"></a>
            <div id="advanced_search_link" class="advsearch_link"> Advanced</div>
            
          <div id="advanced_search" class="adv_searchpopup" style="display:none;">
            <div class="adv_searchformbox">
            	<h3>Advance Search</h3>
                <a id="advanced_search_close" href="#">Close </a>
                <form action="#" method="post">
                	<ol>
                    	<li><label for="filter">Name:</label>
                        	<input class="text" type="text" name="adv_search_name" id="adv_search_name" />
                        </li>
                        <li><label for="filter">Status:</label>
                        	<select class="select" id="adv_search_state">
								<option value=""></option>
								<option value="Up">Up</option>
								<option value="Down">Down</option>
								<option value="Disconnected">Disconnected</option>
								<option value="Updating">Updating</option>
								<option value="Alert">Alert</option>
								<option value="PrepareForMaintenance">PrepareForMaintenance</option>
								<option value="Maintenance">Maintenance</option>
								<option value="ErrorInMaintenance">ErrorInMaintenance</option>
                            </select>
                        </li>
                        <li><label for="filter">Zone:</label>
                        	<select class="select" id="adv_search_zone">
                            </select>
                        </li>
						<li><label for="filter" id="adv_search_pod_label">Pod:</label>
                        	<select class="select" id="adv_search_pod">
                            </select>
                        </li>
                    </ol>
                </form>
               <div class="adv_search_actionbox">
                    	<div class="adv_searchpopup_button" id="adv_search_button"></div>
				</div>
            </div>
          </div>
		</div>
	</div>
    <div class="filter_actionbox">
    	<div class="selection_formarea" style="display:none;">
        	<form action="#" method="post">
            	<label for="filter">Filters:</label>
				<select class="select" id="template_type">
                  <option value="true">Zone</option>
                  <option value="false">Private</option>
         		</select>
			</form>
         </div>
         <div class="selection_formarea" style="display:none;">
        	<form action="#" method="post">
				<select class="select" id="template_type">
                  <option value="true">Pod</option>
                  <option value="false">Private</option>
         		</select>
			</form>
         </div>
    </div>
	<div class="grid_container">
    	<div id="loading_gridtable" class="loading_gridtable">
                  <div class="loading_gridanimation"></div>
                   <p>Loading...</p>
             </div>
		<div class="grid_header">
			<div class="gridadmin_hostheader_cell0">
			<div class="grid_headertitles">Status</div>
			</div>			
			<div class="gridadmin_hostheader_cell1">
				<div class="grid_headertitles">Zone</div>
			</div>
			<div class="gridadmin_hostheader_cell1">
				<div class="grid_headertitles">Pod</div>
			</div>
			<div class="gridadmin_hostheader_cell1">
				<div class="grid_headertitles">Cluster</div>
			</div>
			<div class="gridadmin_hostheader_cell2" style="width:10%;">
					<div class="grid_headertitles">Hostname</div>
			</div>
			<div class="gridadmin_hostheader_cell2" style="width:10%;">
					<div class="grid_headertitles">IP</div>
			</div>
			<div class="gridadmin_hostheader_cell1">
				<div class="grid_headertitles">Version</div>
			</div>
			<div class="gridadmin_hostheader_cell1">
				<div class="grid_headertitles">OS Preference</div>
			</div>
			<div class="gridadmin_hostheader_cell2">
				<div class="grid_headertitles">Last Disconnected</div>
			</div>
		</div>
		<div id="grid_content">
        	 
        </div>
	</div>
    <div id="pagination_panel" class="pagination_panel" style="display:none;">
    	<p id="grid_rows_total" />
    	<div class="pagination_actionbox">
        	<div class="pagination_actions">
            	<div class="pagination_actionicon"><img src="images/pagination_refresh.gif" title="refresh" /></div>
                <a id="refresh" href="#"> Refresh</a>
            </div>
            <div class="pagination_actions" id="prevPage_div">
            	<div class="pagination_actionicon"><img src="images/pagination_previcon.gif" title="prev" /></div>
                <a id="prevPage" href="#"> Prev</a>
            </div>
            <div class="pagination_actions" id="nextPage_div">
            	<div class="pagination_actionicon"><img src="images/pagination_nexticon.gif" title="next" /></div>
                <a id="nextPage" href="#"> Next</a>
            </div>
        </div>
    </div>
</div>

<div id="routing_template" style="display:none">
    <div class="adding_loading" style="height: 58px; display: none;">
        <div class="adding_animation">
        </div>
        <div class="adding_text">
            Waiting &hellip;
        </div>
    </div>
	<div id="row_container">
		<div class="green_statusbar" id="host_state_bar"></div>
		<div class="gridadmin_hostrow_cell4">
			<div class="grid_runningtitles" id="routing_state"></div>
		</div>		
		<div class="gridadmin_hostrow_cell1">
			<div class="grid_celltitles" id="routing_zone"></div>
		</div>
		<div class="gridadmin_hostrow_cell1">
			<div class="grid_celltitles" id="routing_pod"></div>
		</div>
		<div class="gridadmin_hostrow_cell1">
			<div class="grid_celltitles" id="routing_cluster"></div>
		</div>
		<div class="gridadmin_hostrow_cell2" style="width:10%;">
			<div class="grid_celltitles" id="routing_name"></div>
		</div>
		<div class="gridadmin_hostrow_cell2" style="width:10%;">
			<div class="grid_celltitles" id="routing_ipaddress"></div>
		</div>
		<div class="gridadmin_hostrow_cell1">
			<div class="grid_celltitles" id="routing_version"></div>
		</div>
		<div class="gridadmin_hostrow_cell1">
			<div class="grid_celltitles" id="routing_os">None</div>
		</div>
		<div class="gridadmin_hostrow_cell2">
			<div class="grid_celltitles" id="routing_disconnected"></div>
		</div>
		<div id="grid_links_container" style="display:none">
			<div class="grid_links">
				<div id="host_action_details_container" style="float:left"><a id="host_action_details" href="#" style="float:left; margin:0 0 0 8px; padding:0">Show Details</a><div class="details_arrow"><img src="images/details_downarrow.jpg" alt="Show Details" /></div> |</div> <div id="host_action_enable_maint_container" style="float:left"><a id="host_action_enable_maint" href="#">Enable Maintenance Mode</a> |</div> <div id="host_action_cancel_maint_container" style="float:left"><a id="host_action_cancel_maint" href="#">Cancel Maintenance Mode</a> |</div> <div id="host_action_reconnect_container" style="float:left"><a id="host_action_reconnect" href="#">Force Reconnect</a> |</div> <div id="host_action_update_os_container" style="float:left"><a id="host_action_update_os" href="#">Update OS Preference</a> | </div> <div id="host_action_remove_container" style="float:left"><a id="host_action_remove" href="#">Remove</a> | </div> 
			</div>
		</div>
		<div class="row_loading" style="display:none; height:58px;"></div>
		<div class="loading_animationcontainer" style="display:none">
			<div class="loading_animationtext"></div>
			<div class="loading_animation"></div>
		</div>
		<div class="loadingmessage_container" style="display:none">
			<div class="loadingmessage_top">
				<p></p>
			</div>
			<div class="loadingmessage_bottom"><a class="continue_button" href="#"></a></div>
		</div>
	</div>
	<div class="hostadmin_showdetails_panel" id="host_detail_panel" style="display:none">
    	<div class="host_statisticspanel">
			<div class="host_statisticslist" id="host_cpu_stat"><div class="hostcpu_icon"></div><p><strong> CPU Total:</strong>  | <strong>CPU Allocated:</strong>  | <span class="host_statisticspanel_green"> <strong>CPU Used:</strong></span></p></div>
			<div class="host_statisticslist" id="host_mem_stat"><div class="hostmemory_icon"></div><p><strong> MEM Total:</strong> | <strong>MEM Allocated:</strong> | <span class="host_statisticspanel_green"> <strong>MEM Used:</strong></span></p></div>
            <div class="host_statisticslist" id="host_network_stat"><div class="hostnetwork_icon"></div><p><strong> Network read:</strong> | <strong>Network write:</strong></p></div>
        </div>
        <div class="hostadmin_showdetails_grid" style="display:block" >
            <div class="hostadmin_showdetailsheader">
                <div class="hostadmin_showdetailsheader_cell" style="width:15%">
                    <div class="grid_headertitles">Type</div>
                </div>
                <div class="hostadmin_showdetailsheader_cell" style="width:20%">
                    <div class="grid_headertitles">Instance Name</div>
                </div>
                <div class="hostadmin_showdetailsheader_cell" style="width:15%">
                    <div class="grid_headertitles">IP</div>
                </div>
                <div class="hostadmin_showdetailsheader_cell" style="width:15%">
                    <div class="grid_headertitles">Service</div>
                </div>
                <div class="hostadmin_showdetailsheader_cell" style="width:15%">
                    <div class="grid_headertitles">Owner</div>
                </div>
                <div class="hostadmin_showdetailsheader_cell" style="width:19%">
                    <div class="grid_headertitles">Created</div>
                </div>
            </div>
            <div id="detail_container">
                <div class="hostadmin_showdetails_row_odd">
                    <div class="hostadmin_showdetailsrow_cell" style="width:100%">
                        <div class="netgrid_celltitles">No Running Instances</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Routing Detail Template -->
<div id="routing_detail_template" style="display:none">
	<div class="hostadmin_showdetailsrow_cell" style="width:15%">
		<div class="netgrid_celltitles" id="detail_type"></div>
	</div>
	<div class="hostadmin_showdetailsrow_cell" style="width:20%">
		<div class="netgrid_celltitles" id="detail_name"></div>
	</div>
	<div class="hostadmin_showdetailsrow_cell" style="width:15%">
		<div class="netgrid_celltitles" id="detail_ip"></div>
	</div>
	<div class="hostadmin_showdetailsrow_cell" style="width:15%">
		<div class="netgrid_celltitles" id="detail_service"></div>
	</div>
	<div class="hostadmin_showdetailsrow_cell" style="width:15%">
		<div class="netgrid_celltitles" id="detail_owner"></div>
	</div>
	<div class="hostadmin_showdetailsrow_cell" style="width:19%">
		<div class="netgrid_celltitles" id="detail_created"></div>
	</div>
</div>

<!-- Add Computing Host Dialog -->
<div id="dialog_add_routing" title="Add New Computing Host" style="display:none">
	<p>Please fill in the following data to add a new Computing Host.</p>
	<div class="dialog_formcontent">
		<form action="#" method="post" id="form_acquire">
			<ol>
				<li>
					<label for="user_name">Availability Zone:</label>
					<select class="select" name="host_zone" id="host_zone">
						<option value="default">Please wait...</option>
					</select>
				</li>
				<li>
					<label for="user_name">Pod:</label>
					<select class="select" name="host_pod" id="host_pod">
						<option value="default">Please wait...</option>
					</select>
				</li>
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

<!-- Update OS Pref Dialog -->
<div id="dialog_update_os" title="Update OS Preference" style="display:none">
	<p>Please choose a OS preference for this host.  Virtual machines will always be allocated to hosts with an OS preference that matches with the OS type of the template chosen for the virtual machine before choosing other hosts.</p>
	<div class="dialog_formcontent">
		<form action="#" method="post" id="form_acquire">
			<ol>
				<li>
					<label for="user_name">OS Preference:</label>
					<select class="select" name="host_os" id="host_os">
						<option value="">None</option>
					</select>
				</li>
			</ol>
		</form>
	</div>
</div>