<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="stuff">
<packages>
<package name="RJ50">
<hole x="-5.715" y="0" drill="3.2512"/>
<hole x="5.715" y="0" drill="3.2512"/>
<pad name="1" x="-5.715" y="8.89" drill="0.9"/>
<pad name="3" x="-3.175" y="8.89" drill="0.9"/>
<pad name="5" x="-0.635" y="8.89" drill="0.9"/>
<pad name="7" x="1.905" y="8.89" drill="0.9"/>
<pad name="9" x="4.445" y="8.89" drill="0.9"/>
<pad name="2" x="-4.445" y="6.35" drill="0.9"/>
<pad name="4" x="-1.905" y="6.35" drill="0.9"/>
<pad name="6" x="0.635" y="6.35" drill="0.9"/>
<pad name="8" x="3.175" y="6.35" drill="0.9"/>
<pad name="10" x="5.715" y="6.35" drill="0.9"/>
<wire x1="-7.6835" y1="-10.541" x2="-7.6835" y2="10.16" width="0.127" layer="21"/>
<wire x1="-7.6835" y1="10.16" x2="7.6835" y2="10.16" width="0.127" layer="21"/>
<wire x1="7.6835" y1="10.16" x2="7.6835" y2="-10.541" width="0.127" layer="21"/>
<wire x1="7.6835" y1="-10.541" x2="-7.6835" y2="-10.541" width="0.127" layer="21"/>
<wire x1="-5.715" y1="8.89" x2="-5.715" y2="-7.62" width="0.127" layer="21"/>
<wire x1="-4.445" y1="6.35" x2="-4.445" y2="-7.62" width="0.127" layer="21"/>
<wire x1="-3.175" y1="8.89" x2="-3.175" y2="-7.62" width="0.127" layer="21"/>
<wire x1="-1.905" y1="6.35" x2="-1.905" y2="-7.62" width="0.127" layer="21"/>
<wire x1="-0.635" y1="8.89" x2="-0.635" y2="-7.62" width="0.127" layer="21"/>
<wire x1="0.635" y1="6.35" x2="0.635" y2="-7.62" width="0.127" layer="21"/>
<wire x1="1.905" y1="8.89" x2="1.905" y2="-7.62" width="0.127" layer="21"/>
<wire x1="3.175" y1="6.35" x2="3.175" y2="-7.62" width="0.127" layer="21"/>
<wire x1="4.445" y1="8.89" x2="4.445" y2="-7.62" width="0.127" layer="21"/>
<wire x1="5.715" y1="6.35" x2="5.715" y2="-7.62" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="RJ50">
<pin name="1" x="0" y="0" length="middle" rot="R180"/>
<pin name="2" x="0" y="2.54" length="middle" rot="R180"/>
<pin name="3" x="0" y="5.08" length="middle" rot="R180"/>
<pin name="4" x="0" y="7.62" length="middle" rot="R180"/>
<pin name="5" x="0" y="10.16" length="middle" rot="R180"/>
<pin name="6" x="0" y="12.7" length="middle" rot="R180"/>
<pin name="7" x="0" y="15.24" length="middle" rot="R180"/>
<pin name="8" x="0" y="17.78" length="middle" rot="R180"/>
<pin name="9" x="0" y="20.32" length="middle" rot="R180"/>
<pin name="10" x="0" y="22.86" length="middle" rot="R180"/>
<text x="-7.62" y="25.4" size="1.27" layer="95">&gt;NAME</text>
<wire x1="-5.08" y1="25.4" x2="-5.08" y2="-2.54" width="0.254" layer="95"/>
<wire x1="-5.08" y1="-2.54" x2="-12.7" y2="-2.54" width="0.254" layer="95"/>
<wire x1="-12.7" y1="-2.54" x2="-12.7" y2="25.4" width="0.254" layer="95"/>
<wire x1="-12.7" y1="25.4" x2="-5.08" y2="25.4" width="0.254" layer="95"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="RJ50-STEWARD">
<gates>
<gate name="RJ50" symbol="RJ50" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RJ50">
<connects>
<connect gate="RJ50" pin="1" pad="1"/>
<connect gate="RJ50" pin="10" pad="10"/>
<connect gate="RJ50" pin="2" pad="2"/>
<connect gate="RJ50" pin="3" pad="3"/>
<connect gate="RJ50" pin="4" pad="4"/>
<connect gate="RJ50" pin="5" pad="5"/>
<connect gate="RJ50" pin="6" pad="6"/>
<connect gate="RJ50" pin="7" pad="7"/>
<connect gate="RJ50" pin="8" pad="8"/>
<connect gate="RJ50" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-coax">
<description>&lt;b&gt;Coax Connectors&lt;/b&gt;&lt;p&gt;
Radiall  and M/A COM.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="BU-SMA-H">
<description>FEMALE &lt;b&gt;SMA CONNECTOR&lt;/b&gt;&lt;p&gt;
Radiall&lt;p&gt;</description>
<wire x1="-1.1" y1="3.2" x2="1.1" y2="3.2" width="0.2032" layer="21"/>
<wire x1="3.2" y1="1.1" x2="3.2" y2="-1.1" width="0.2032" layer="21"/>
<wire x1="1.1" y1="-3.2" x2="-1.1" y2="-3.2" width="0.2032" layer="21"/>
<wire x1="-3.2" y1="-1.1" x2="-3.2" y2="1.1" width="0.2032" layer="21"/>
<wire x1="-3.1999" y1="3.1999" x2="3.2" y2="3.2" width="0.2032" layer="51"/>
<wire x1="3.2" y1="3.2" x2="3.2" y2="2.9" width="0.2032" layer="51"/>
<wire x1="3.2" y1="2.9" x2="3.2" y2="-2.9" width="0.2032" layer="51"/>
<wire x1="3.2" y1="-2.9" x2="3.1999" y2="-3.1999" width="0.2032" layer="51"/>
<wire x1="3.1999" y1="-3.1999" x2="-3.2" y2="-3.2" width="0.2032" layer="51"/>
<wire x1="-3.2" y1="-3.2" x2="-3.1999" y2="3.1999" width="0.2032" layer="51"/>
<wire x1="3.2" y1="2.9" x2="4.3" y2="2.9" width="0.2032" layer="51"/>
<wire x1="4.3" y1="2.9" x2="8.3" y2="2.9" width="0.2032" layer="21"/>
<wire x1="8.3" y1="2.9" x2="8.6" y2="3.4" width="0.2032" layer="21"/>
<wire x1="10.7" y1="3.4" x2="11" y2="2.9" width="0.2032" layer="21"/>
<wire x1="11" y1="2.9" x2="11.6" y2="2.9" width="0.2032" layer="21"/>
<wire x1="11.6" y1="-2.9" x2="11.6" y2="2.9" width="0.2032" layer="21"/>
<wire x1="8.6" y1="3.4" x2="10.7" y2="3.4" width="0.2032" layer="21"/>
<wire x1="3.2" y1="-2.9" x2="4.3" y2="-2.9" width="0.2032" layer="51"/>
<wire x1="4.3" y1="-2.9" x2="8.3" y2="-2.9" width="0.2032" layer="21"/>
<wire x1="8.3" y1="-2.9" x2="8.6" y2="-3.4" width="0.2032" layer="21"/>
<wire x1="10.7" y1="-3.4" x2="11" y2="-2.9" width="0.2032" layer="21"/>
<wire x1="11" y1="-2.9" x2="11.6" y2="-2.9" width="0.2032" layer="21"/>
<wire x1="8.6" y1="-3.4" x2="10.7" y2="-3.4" width="0.2032" layer="21"/>
<wire x1="11" y1="-2.9" x2="11" y2="2.9" width="0.2032" layer="21"/>
<wire x1="8.3" y1="-2.9" x2="8.3" y2="2.9" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="3.1999" width="0.2032" layer="51"/>
<circle x="0" y="0" radius="1.7" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.27"/>
<pad name="2" x="-2.5499" y="2.5499" drill="1.778"/>
<pad name="3" x="2.5499" y="2.5499" drill="1.778"/>
<pad name="4" x="2.5499" y="-2.5499" drill="1.778"/>
<pad name="5" x="-2.5499" y="-2.5499" drill="1.778"/>
<text x="-2.54" y="4.445" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-5.715" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="BNC-FGND">
<wire x1="0" y1="-2.54" x2="-0.762" y2="-1.778" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-0.508" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0.508" x2="-0.762" y2="0.508" width="0.254" layer="94"/>
<wire x1="-0.762" y1="0.508" x2="-0.508" y2="0" width="0.254" layer="94"/>
<wire x1="-0.508" y1="0" x2="-0.762" y2="-0.508" width="0.254" layer="94"/>
<wire x1="-0.762" y1="-0.508" x2="-2.54" y2="-0.508" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="0" y2="0.508" width="0.3048" layer="94" curve="-79.611142" cap="flat"/>
<wire x1="-2.54" y1="-2.54" x2="0" y2="-0.508" width="0.3048" layer="94" curve="79.611142" cap="flat"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.54" y="3.302" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="2.54" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="BU-SMA-H" prefix="X">
<description>FEMALE &lt;b&gt;SMA CONNECTOR&lt;/b&gt;&lt;p&gt;
Radiall&lt;p&gt;</description>
<gates>
<gate name="G$1" symbol="BNC-FGND" x="0" y="0"/>
</gates>
<devices>
<device name="" package="BU-SMA-H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2 3 4 5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-molex">
<description>&lt;b&gt;Molex Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="22-23-2031">
<description>.100" (2.54mm) Center Header - 3 Pin</description>
<wire x1="-3.81" y1="3.175" x2="3.81" y2="3.175" width="0.254" layer="21"/>
<wire x1="3.81" y1="3.175" x2="3.81" y2="1.27" width="0.254" layer="21"/>
<wire x1="3.81" y1="1.27" x2="3.81" y2="-3.175" width="0.254" layer="21"/>
<wire x1="3.81" y1="-3.175" x2="-3.81" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-3.81" y1="-3.175" x2="-3.81" y2="1.27" width="0.254" layer="21"/>
<wire x1="-3.81" y1="1.27" x2="-3.81" y2="3.175" width="0.254" layer="21"/>
<wire x1="-3.81" y1="1.27" x2="3.81" y2="1.27" width="0.254" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="0" y="0" drill="1" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="0" drill="1" shape="long" rot="R90"/>
<text x="-3.81" y="3.81" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-5.08" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="MV">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="22-23-2031" prefix="X">
<description>.100" (2.54mm) Center Header - 3 Pin</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="2.54" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="22-23-2031">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="22-23-2031" constant="no"/>
<attribute name="OC_FARNELL" value="1462950" constant="no"/>
<attribute name="OC_NEWARK" value="30C0862" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="stuff" deviceset="RJ50-STEWARD" device=""/>
<part name="X1" library="con-coax" deviceset="BU-SMA-H" device=""/>
<part name="X2" library="con-coax" deviceset="BU-SMA-H" device=""/>
<part name="X3" library="con-coax" deviceset="BU-SMA-H" device=""/>
<part name="X4" library="con-coax" deviceset="BU-SMA-H" device=""/>
<part name="X5" library="con-coax" deviceset="BU-SMA-H" device=""/>
<part name="X6" library="con-coax" deviceset="BU-SMA-H" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="X7" library="con-molex" deviceset="22-23-2031" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="X8" library="con-coax" deviceset="BU-SMA-H" device=""/>
<part name="X9" library="con-coax" deviceset="BU-SMA-H" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="U$2" library="stuff" deviceset="RJ50-STEWARD" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="RJ50" x="12.7" y="22.86" rot="MR180"/>
<instance part="X1" gate="G$1" x="63.5" y="35.56" rot="R270"/>
<instance part="X2" gate="G$1" x="50.8" y="35.56" rot="R270"/>
<instance part="X3" gate="G$1" x="38.1" y="35.56" rot="R270"/>
<instance part="X4" gate="G$1" x="63.5" y="-17.78" rot="R90"/>
<instance part="X5" gate="G$1" x="50.8" y="-17.78" rot="R90"/>
<instance part="X6" gate="G$1" x="38.1" y="-17.78" rot="R90"/>
<instance part="GND1" gate="1" x="60.96" y="30.48"/>
<instance part="GND2" gate="1" x="48.26" y="30.48"/>
<instance part="GND3" gate="1" x="35.56" y="30.48"/>
<instance part="GND4" gate="1" x="66.04" y="-12.7" rot="R180"/>
<instance part="GND5" gate="1" x="53.34" y="-12.7" rot="R180"/>
<instance part="GND6" gate="1" x="40.64" y="-12.7" rot="R180"/>
<instance part="X7" gate="-1" x="25.4" y="-20.32" rot="MR270"/>
<instance part="X7" gate="-2" x="27.94" y="-20.32" rot="MR270"/>
<instance part="X7" gate="-3" x="30.48" y="-20.32" rot="MR270"/>
<instance part="GND7" gate="1" x="30.48" y="-15.24" rot="MR180"/>
<instance part="X8" gate="G$1" x="76.2" y="35.56" rot="R270"/>
<instance part="X9" gate="G$1" x="15.24" y="-17.78" rot="R90"/>
<instance part="GND8" gate="1" x="73.66" y="30.48"/>
<instance part="GND9" gate="1" x="17.78" y="-12.7" rot="R180"/>
<instance part="U$2" gate="RJ50" x="78.74" y="22.86" rot="R180"/>
</instances>
<busses>
</busses>
<nets>
<net name="SC1" class="0">
<segment>
<wire x1="12.7" y1="22.86" x2="76.2" y2="22.86" width="0.1524" layer="91"/>
<label x="17.78" y="22.86" size="1.778" layer="95"/>
<pinref part="X8" gate="G$1" pin="1"/>
<wire x1="76.2" y1="22.86" x2="76.2" y2="33.02" width="0.1524" layer="91"/>
<pinref part="U$1" gate="RJ50" pin="1"/>
<pinref part="U$2" gate="RJ50" pin="1"/>
<wire x1="76.2" y1="22.86" x2="78.74" y2="22.86" width="0.1524" layer="91"/>
<junction x="76.2" y="22.86"/>
</segment>
</net>
<net name="AI+" class="0">
<segment>
<label x="17.78" y="20.32" size="1.778" layer="95"/>
<pinref part="X1" gate="G$1" pin="1"/>
<wire x1="63.5" y1="33.02" x2="63.5" y2="20.32" width="0.1524" layer="91"/>
<wire x1="63.5" y1="20.32" x2="12.7" y2="20.32" width="0.1524" layer="91"/>
<pinref part="U$1" gate="RJ50" pin="2"/>
<pinref part="U$2" gate="RJ50" pin="2"/>
<wire x1="63.5" y1="20.32" x2="78.74" y2="20.32" width="0.1524" layer="91"/>
<junction x="63.5" y="20.32"/>
</segment>
</net>
<net name="AI-" class="0">
<segment>
<label x="17.78" y="17.78" size="1.778" layer="95"/>
<pinref part="X2" gate="G$1" pin="1"/>
<wire x1="50.8" y1="33.02" x2="50.8" y2="17.78" width="0.1524" layer="91"/>
<wire x1="50.8" y1="17.78" x2="12.7" y2="17.78" width="0.1524" layer="91"/>
<pinref part="U$1" gate="RJ50" pin="3"/>
<pinref part="U$2" gate="RJ50" pin="3"/>
<wire x1="50.8" y1="17.78" x2="78.74" y2="17.78" width="0.1524" layer="91"/>
<junction x="50.8" y="17.78"/>
</segment>
</net>
<net name="RS+" class="0">
<segment>
<label x="17.78" y="15.24" size="1.778" layer="95"/>
<pinref part="X3" gate="G$1" pin="1"/>
<wire x1="38.1" y1="33.02" x2="38.1" y2="15.24" width="0.1524" layer="91"/>
<wire x1="38.1" y1="15.24" x2="12.7" y2="15.24" width="0.1524" layer="91"/>
<pinref part="U$1" gate="RJ50" pin="4"/>
<pinref part="U$2" gate="RJ50" pin="4"/>
<wire x1="38.1" y1="15.24" x2="78.74" y2="15.24" width="0.1524" layer="91"/>
<junction x="38.1" y="15.24"/>
</segment>
</net>
<net name="RS-" class="0">
<segment>
<label x="17.78" y="12.7" size="1.778" layer="95"/>
<pinref part="X4" gate="G$1" pin="1"/>
<wire x1="63.5" y1="12.7" x2="12.7" y2="12.7" width="0.1524" layer="91"/>
<wire x1="63.5" y1="-15.24" x2="63.5" y2="12.7" width="0.1524" layer="91"/>
<pinref part="U$1" gate="RJ50" pin="5"/>
<pinref part="U$2" gate="RJ50" pin="5"/>
<wire x1="63.5" y1="12.7" x2="78.74" y2="12.7" width="0.1524" layer="91"/>
<junction x="63.5" y="12.7"/>
</segment>
</net>
<net name="EX+" class="0">
<segment>
<wire x1="12.7" y1="10.16" x2="50.8" y2="10.16" width="0.1524" layer="91"/>
<label x="17.78" y="10.16" size="1.778" layer="95"/>
<pinref part="X5" gate="G$1" pin="1"/>
<wire x1="50.8" y1="-15.24" x2="50.8" y2="10.16" width="0.1524" layer="91"/>
<pinref part="U$1" gate="RJ50" pin="6"/>
<pinref part="U$2" gate="RJ50" pin="6"/>
<wire x1="50.8" y1="10.16" x2="78.74" y2="10.16" width="0.1524" layer="91"/>
<junction x="50.8" y="10.16"/>
</segment>
</net>
<net name="EX-" class="0">
<segment>
<wire x1="12.7" y1="7.62" x2="38.1" y2="7.62" width="0.1524" layer="91"/>
<label x="17.78" y="7.62" size="1.778" layer="95"/>
<pinref part="X6" gate="G$1" pin="1"/>
<wire x1="38.1" y1="-15.24" x2="38.1" y2="7.62" width="0.1524" layer="91"/>
<pinref part="U$1" gate="RJ50" pin="7"/>
<pinref part="U$2" gate="RJ50" pin="7"/>
<wire x1="38.1" y1="7.62" x2="78.74" y2="7.62" width="0.1524" layer="91"/>
<junction x="38.1" y="7.62"/>
</segment>
</net>
<net name="T+" class="0">
<segment>
<wire x1="12.7" y1="5.08" x2="27.94" y2="5.08" width="0.1524" layer="91"/>
<label x="17.78" y="5.08" size="1.778" layer="95"/>
<wire x1="27.94" y1="-17.78" x2="27.94" y2="5.08" width="0.1524" layer="91"/>
<pinref part="U$1" gate="RJ50" pin="8"/>
<pinref part="X7" gate="-2" pin="S"/>
<pinref part="U$2" gate="RJ50" pin="8"/>
<wire x1="27.94" y1="5.08" x2="78.74" y2="5.08" width="0.1524" layer="91"/>
<junction x="27.94" y="5.08"/>
</segment>
</net>
<net name="T-" class="0">
<segment>
<wire x1="12.7" y1="2.54" x2="25.4" y2="2.54" width="0.1524" layer="91"/>
<label x="17.78" y="2.54" size="1.778" layer="95"/>
<pinref part="U$1" gate="RJ50" pin="9"/>
<pinref part="X7" gate="-1" pin="S"/>
<wire x1="25.4" y1="2.54" x2="25.4" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="U$2" gate="RJ50" pin="9"/>
<wire x1="25.4" y1="2.54" x2="78.74" y2="2.54" width="0.1524" layer="91"/>
<junction x="25.4" y="2.54"/>
</segment>
</net>
<net name="SC2" class="0">
<segment>
<wire x1="12.7" y1="0" x2="15.24" y2="0" width="0.1524" layer="91"/>
<label x="17.78" y="0" size="1.778" layer="95"/>
<pinref part="X9" gate="G$1" pin="1"/>
<wire x1="15.24" y1="0" x2="15.24" y2="-15.24" width="0.1524" layer="91"/>
<pinref part="U$1" gate="RJ50" pin="10"/>
<pinref part="U$2" gate="RJ50" pin="10"/>
<wire x1="15.24" y1="0" x2="78.74" y2="0" width="0.1524" layer="91"/>
<junction x="15.24" y="0"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="2"/>
<pinref part="GND1" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="X2" gate="G$1" pin="2"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="X3" gate="G$1" pin="2"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="X4" gate="G$1" pin="2"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="X5" gate="G$1" pin="2"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="X6" gate="G$1" pin="2"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="X7" gate="-3" pin="S"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="X8" gate="G$1" pin="2"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="X9" gate="G$1" pin="2"/>
<pinref part="GND9" gate="1" pin="GND"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
