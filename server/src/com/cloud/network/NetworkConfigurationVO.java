/**
 *  Copyright (C) 2010 Cloud.com, Inc.  All rights reserved.
 * 
 * This software is licensed under the GNU General Public License v3 or later.  
 * 
 * It is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 */
package com.cloud.network;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import com.cloud.network.Network.BroadcastDomainType;
import com.cloud.network.Network.Mode;
import com.cloud.network.Network.TrafficType;
import com.cloud.utils.NumbersUtil;
import com.cloud.utils.net.NetUtils;

/**
 * NetworkConfigurationVO contains information about a specific network.
 *
 */
@Entity
@Table(name="network_configurations")
public class NetworkConfigurationVO implements NetworkConfiguration {
    @Id
    @TableGenerator(name="network_configuration_sq", table="sequence", pkColumnName="name", valueColumnName="value", pkColumnValue="network_configuration_seq", allocationSize=1)
    @Column(name="id")
    long id;
    
    @Column(name="mode")
    @Enumerated(value=EnumType.STRING)
    Mode mode;
    
    @Column(name="broadcast_domain_type")
    @Enumerated(value=EnumType.STRING)
    BroadcastDomainType broadcastDomainType;
    
    @Column(name="traffic_type")
    @Enumerated(value=EnumType.STRING)
    TrafficType trafficType;
    
    @Column(name="broadcast_uri")
    String broadcastUri; 
    
    @Column(name="gateway")
    String gateway;
    
    @Column(name="cidr")
    String cidr;
    
    @Column(name="network_offering_id")
    long networkOfferingId;
    
    @Column(name="data_center_id")
    long dataCenterId;
    
    @Column(name="related")
    long related;
    
    @Column(name="guru_name")
    String guruName;
    
    @Column(name="state")
    @Enumerated(value=EnumType.STRING)
    State state;
    
    @Column(name="dns")
    String dns;
    
    @Column(name="domain_id")
    long domainId;
    
    @Column(name="account_id")
    long accountId;
    
    @Column(name="mac_address_seq", updatable=false, nullable=false)
    @TableGenerator(name="mac_address_seq", table="network_configuration", pkColumnName="id", valueColumnName="mac_address_seq", allocationSize=1)
    long macAddress = 1;
    
    public NetworkConfigurationVO() {
    }
    
    /**
     * Constructor to be used for the adapters because it only initializes what's needed.
     * @param trafficType
     * @param mode
     * @param broadcastDomainType
     * @param networkOfferingId
     * @param dataCenterId
     */
    public NetworkConfigurationVO(TrafficType trafficType, Mode mode, BroadcastDomainType broadcastDomainType, long networkOfferingId, long dataCenterId) {
        this.trafficType = trafficType;
        this.mode = mode;
        this.broadcastDomainType = broadcastDomainType;
        this.networkOfferingId = networkOfferingId;
        this.dataCenterId = dataCenterId;
        this.state = State.Allocated;
    }
    
    public NetworkConfigurationVO(long id, NetworkConfiguration that, long offeringId, long dataCenterId, String guruName, long domainId, long accountId, long related) {
        this(id, that.getTrafficType(), that.getMode(), that.getBroadcastDomainType(), offeringId, dataCenterId, domainId, accountId, related);
        this.guruName = guruName;
        this.state = that.getState();
    }

    /**
     * Constructor for the actual DAO object.
     * @param trafficType
     * @param mode
     * @param broadcastDomainType
     * @param networkOfferingId
     * @param dataCenterId
     * @param domainId
     * @param accountId
     */
    public NetworkConfigurationVO(long id, TrafficType trafficType, Mode mode, BroadcastDomainType broadcastDomainType, long networkOfferingId, long dataCenterId, long domainId, long accountId, long related) {
        this(trafficType, mode, broadcastDomainType, networkOfferingId, dataCenterId);
        this.domainId = domainId;
        this.accountId = accountId;
        this.related = related;
    }
    
    @Override
    public State getState() {
        return state;
    }
    
    public void setState(State state) {
        this.state = state;
    }
    
    @Override
    public long getRelated() {
        return related;
    }

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public Mode getMode() {
        return mode;
    }
    
    @Override
    public long getAccountId() {
        return accountId;
    }
    
    @Override
    public long getDomainId() {
        return domainId;
    }
    
    @Override
    public long getNetworkOfferingId() {
        return networkOfferingId;
    }

    public void setMode(Mode mode) {
        this.mode = mode;
    }

    @Override
    public BroadcastDomainType getBroadcastDomainType() {
        return broadcastDomainType;
    }
    
    public String getGuruName() {
        return guruName;
    }
    
    public void setGuruName(String guruName) {
        this.guruName = guruName;
    }

    public void setBroadcastDomainType(BroadcastDomainType broadcastDomainType) {
        this.broadcastDomainType = broadcastDomainType;
    }

    @Override
    public TrafficType getTrafficType() {
        return trafficType;
    }

    public void setTrafficType(TrafficType trafficType) {
        this.trafficType = trafficType;
    }

    @Override
    public String getGateway() {
        return gateway;
    }

    public void setGateway(String gateway) {
        this.gateway = gateway;
    }

    @Override
    public String getCidr() {
        return cidr;
    }

    public void setCidr(String cidr) {
        this.cidr = cidr;
    }
    
    public String getBroadcastUri() {
        return broadcastUri;
    }

    public void setBroadcastUri(String broadcastUri) {
        this.broadcastUri = broadcastUri;
    }
    
    @Override
    public int hashCode() {
        return NumbersUtil.hash(id);
    }
    
    @Override
    public long getDataCenterId() {
        return dataCenterId;
    }
    
    public String getDns() {
        return dns;
    }
    
    public void setDns(String dns) {
        this.dns = dns;
    }
    
    @Override
    public boolean equals(Object obj) {
        if (!(obj instanceof NetworkConfigurationVO)) {
            return false;
        }
        NetworkConfigurationVO that = (NetworkConfigurationVO)obj;
        if (this.trafficType != that.trafficType) {
            return false;
        }
        
        if ((this.cidr == null && that.cidr != null) || (this.cidr != null && that.cidr == null)) {
            return false;
        }
        
        if (this.cidr == null && that.cidr == null) {
            return true;
        }
        
        return NetUtils.isNetworkAWithinNetworkB(this.cidr, that.cidr);
    }
}