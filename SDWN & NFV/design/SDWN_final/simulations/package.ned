package sdwn_final.simulations;

import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.inet.WirelessHost;
import inet.node.wireless.AccessPoint;
import inet.physicallayer.ieee80211.packetlevel.Ieee80211RadioMedium;
import openflow.openflow.controller.Open_Flow_Controller;
import openflow.openflow.switch.Open_Flow_Switch;
import inet.node.inet.AdhocHost;
@license(LGPL);

network Network1
{
    parameters:
        int numCli = default(2);
        @display("b=600,400;i=block/network2,grey,30;bgb=727,399,,,0");

    submodules:
        radioMedium: Ieee80211RadioMedium {
            parameters:
                analogModel.typename = "ScalarAnalogModel";
                pathLoss.typename = "FreeSpacePathLoss";
                obstacleLoss.typename = "DielectricObstacleLoss";
                @display("p=634,104");
        }

        AccessPoint1: AccessPoint {
            parameters:
                wlan[0].mgmt.typename = "HostapMgmt";
                wlan[0].agent.typename = "MgmtFrameForwarder";
                wlan[0].radio.typename = "Ieee80211Radio";
                ethg[0].typename = "EthernetInterface";
                @display("p=312,142");
        }
        AccessPoint2: AccessPoint {
            parameters:
                wlan[0].mgmt.typename = "HostapMgmt";
                wlan[0].agent.typename = "MgmtFrameForwarder";
                wlan[0].radio.typename = "Ieee80211Radio";
                ethg[0].typename = "EthernetInterface";
                @display("p=312,287");
        }
        host1: WirelessHost {
            parameters:
                wlan[0].radio.typename = "Ieee80211Radio";
                mobility.typename = "StationaryMobility";
                @display("p=88,70");
        }

        host2: WirelessHost {
            parameters:
                wlan[0].radio.typename = "Ieee80211Radio";
                mobility.typename = "StationaryMobility";
                @display("p=88,188");
        }
        host3: AdhocHost {
            @display("p=87,322");
        }
        controller: Open_Flow_Controller {
            @display("p=645,223;i2=-");
        }

        switch: Open_Flow_Switch {
            @display("p=516,222;i2=-");
        }

        configurator: IPv4NetworkConfigurator {
            @display("p=635,36");
        }

    connections:
}
