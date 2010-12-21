package com.cloud.network.lb;

import java.util.List;

import com.cloud.network.rules.FirewallRule;
import com.cloud.network.rules.LoadBalancer;
import com.cloud.utils.net.Ip;

public class LoadBalancingRule implements FirewallRule, LoadBalancer{
    private LoadBalancer lb;
    private List<LbDestination> destinations;
    
    public LoadBalancingRule(LoadBalancer lb, List<LbDestination> destinations) { 
        this.lb = lb;
        this.destinations = destinations;
    }
    
    @Override
    public long getId() {
        return lb.getId();
    }
    
    @Override
    public long getAccountId() {
        return lb.getAccountId();
    }
    
    @Override
    public long getDomainId() {
        return lb.getDomainId();
    }
    
    @Override
    public String getName() {
        return lb.getName();
    }
    
    @Override
    public String getDescription() {
        return lb.getDescription();
    }

    public int getDefaultPortStart() {
        return lb.getDefaultPortStart();
    }
    
    @Override
    public int getDefaultPortEnd() {
        return lb.getDefaultPortEnd();
    }

    @Override
    public String getAlgorithm() {
        return lb.getAlgorithm();
    }
    
    @Override
    public String getXid() {
        return lb.getXid();
    }
    
    @Override
    public Ip getSourceIpAddress() {
        return lb.getSourceIpAddress();
    }
    
    @Override
    public int getSourcePortStart() {
        return lb.getSourcePortStart();
    }
    
    @Override
    public int getSourcePortEnd() {
        return lb.getSourcePortEnd();
    }

    @Override
    public String getProtocol() {
        return lb.getProtocol();
    }
    
    @Override
    public Purpose getPurpose() {
        return Purpose.LoadBalancing;
    }
    
    @Override
    public State getState() {
        return lb.getState();
    }
    
    @Override
    public long getNetworkId() {
        return lb.getNetworkId();
    }
    
    public LoadBalancer getLb() {
        return lb;
    }

    public List<LbDestination> getDestinations() {
        return destinations;
    }
    
    public interface Destination {
        String getIpAddress();
        int getDestinationPortStart();
        int getDestinationPortEnd();
        boolean isRevoked();
    }
    
    public static class LbDestination implements Destination {
        private int portStart;
        private int portEnd;
        private String ip;
        boolean revoked;
        
        public LbDestination(int portStart, int portEnd, String ip, boolean revoked) {
            this.portStart = portStart;
            this.portEnd = portEnd;
            this.ip = ip;
            this.revoked = revoked;
        }
        
        public String getIpAddress() {
            return ip;
        }
        public int getDestinationPortStart() {
            return portStart;
        }
        public int getDestinationPortEnd() {
            return portEnd;
        }
        
        public boolean isRevoked() {
            return revoked;
        }
    }
}