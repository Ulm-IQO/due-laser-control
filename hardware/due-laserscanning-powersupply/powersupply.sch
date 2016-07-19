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
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
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
<library name="traco">
<packages>
<package name="TEL-15">
<pad name="1" x="15.24" y="15.24" drill="0.8" shape="square"/>
<pad name="2" x="15.24" y="10.16" drill="0.8"/>
<pad name="3" x="35.56" y="22.86" drill="0.8"/>
<pad name="4" x="35.56" y="12.7" drill="0.8"/>
<pad name="5" x="35.56" y="2.54" drill="0.8"/>
<wire x1="0" y1="0" x2="0" y2="25.4" width="0.127" layer="21"/>
<wire x1="0" y1="25.4" x2="50.8" y2="25.4" width="0.127" layer="21"/>
<wire x1="50.8" y1="25.4" x2="50.8" y2="0" width="0.127" layer="21"/>
<wire x1="50.8" y1="0" x2="0" y2="0" width="0.127" layer="21"/>
<text x="1.27" y="22.86" size="1.27" layer="21">&gt;NAME</text>
<text x="1.27" y="2.54" size="1.27" layer="21">&gt;VALUE</text>
</package>
<package name="TEL-5-SINGLE">
<pad name="2" x="5.08" y="17.78" drill="0.8"/>
<pad name="3" x="7.62" y="17.78" drill="0.8"/>
<pad name="11" x="27.94" y="17.78" drill="0.8"/>
<pad name="14" x="27.94" y="2.54" drill="0.8"/>
<pad name="16" x="22.86" y="2.54" drill="0.8"/>
<pad name="22" x="7.62" y="2.54" drill="0.8"/>
<pad name="23" x="5.08" y="2.54" drill="0.8"/>
<wire x1="0.635" y1="0" x2="0.635" y2="20.32" width="0.127" layer="21"/>
<wire x1="0.635" y1="20.32" x2="32.385" y2="20.32" width="0.127" layer="21"/>
<wire x1="32.385" y1="20.32" x2="32.385" y2="0" width="0.127" layer="21"/>
<wire x1="32.385" y1="0" x2="0.635" y2="0" width="0.127" layer="21"/>
<text x="2.54" y="21.59" size="1.27" layer="21">&gt;NAME</text>
<text x="19.05" y="21.59" size="1.27" layer="21">&gt;VALUE</text>
</package>
<package name="TSR2">
<pad name="1" x="-2.54" y="0" drill="0.8" shape="square"/>
<pad name="2" x="0" y="0" drill="0.8"/>
<pad name="3" x="2.54" y="0" drill="0.8"/>
<wire x1="-6.985" y1="-3.81" x2="-6.985" y2="3.81" width="0.127" layer="21"/>
<wire x1="-6.985" y1="3.81" x2="6.985" y2="3.81" width="0.127" layer="21"/>
<wire x1="6.985" y1="3.81" x2="6.985" y2="-3.81" width="0.127" layer="21"/>
<wire x1="6.985" y1="-3.81" x2="-6.985" y2="-3.81" width="0.127" layer="21"/>
<text x="-6.35" y="4.445" size="1.27" layer="21">&gt;NAME</text>
<text x="-6.35" y="-5.715" size="1.27" layer="21">&gt;VALUE</text>
</package>
<package name="SO8">
<description>&lt;b&gt;8-Lead Small Outline IC&lt;/b&gt; (SO-8)&lt;p&gt;
Source: http://www.analog.com/UploadedFiles/Data_Sheets/703465986AD8611_2_0.pdf</description>
<wire x1="2.4" y1="1.9" x2="2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.4" x2="2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.9" x2="-2.4" y2="-1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.9" x2="-2.4" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="-1.4" x2="-2.4" y2="1.9" width="0.2032" layer="51"/>
<wire x1="-2.4" y1="1.9" x2="2.4" y2="1.9" width="0.2032" layer="51"/>
<wire x1="2.4" y1="-1.4" x2="-2.4" y2="-1.4" width="0.2032" layer="51"/>
<smd name="2" x="-0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="-0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="1" x="-1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="0.635" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="1.905" y="-2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="-1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="0.635" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="1.905" y="2.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-3.175" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="4.445" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.1501" y1="-3.1001" x2="-1.6599" y2="-2" layer="51"/>
<rectangle x1="-0.8801" y1="-3.1001" x2="-0.3899" y2="-2" layer="51"/>
<rectangle x1="0.3899" y1="-3.1001" x2="0.8801" y2="-2" layer="51"/>
<rectangle x1="1.6599" y1="-3.1001" x2="2.1501" y2="-2" layer="51"/>
<rectangle x1="1.6599" y1="2" x2="2.1501" y2="3.1001" layer="51"/>
<rectangle x1="0.3899" y1="2" x2="0.8801" y2="3.1001" layer="51"/>
<rectangle x1="-0.8801" y1="2" x2="-0.3899" y2="3.1001" layer="51"/>
<rectangle x1="-2.1501" y1="2" x2="-1.6599" y2="3.1001" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="TEL-15">
<wire x1="0" y1="25.4" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="38.1" y2="0" width="0.254" layer="94"/>
<wire x1="38.1" y1="0" x2="38.1" y2="25.4" width="0.254" layer="94"/>
<wire x1="38.1" y1="25.4" x2="0" y2="25.4" width="0.254" layer="94"/>
<pin name="+VOUT" x="43.18" y="20.32" length="middle" rot="R180"/>
<pin name="-VOUT" x="43.18" y="5.08" length="middle" rot="R180"/>
<pin name="+VIN" x="-5.08" y="17.78" length="middle"/>
<pin name="-VIN" x="-5.08" y="7.62" length="middle"/>
<text x="2.54" y="27.94" size="1.27" layer="94">&gt;NAME</text>
<text x="25.4" y="27.94" size="1.27" layer="94">&gt;VALUE</text>
<pin name="COMMON" x="43.18" y="12.7" length="middle" rot="R180"/>
</symbol>
<symbol name="TEL-5-SINGLE">
<wire x1="0" y1="25.4" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="38.1" y2="0" width="0.254" layer="94"/>
<wire x1="38.1" y1="0" x2="38.1" y2="25.4" width="0.254" layer="94"/>
<wire x1="38.1" y1="25.4" x2="0" y2="25.4" width="0.254" layer="94"/>
<pin name="+VIN1" x="-5.08" y="20.32" visible="pin" length="middle"/>
<pin name="-VIN1" x="-5.08" y="5.08" length="middle"/>
<pin name="+VOUT" x="43.18" y="20.32" length="middle" rot="R180"/>
<pin name="-VOUT" x="43.18" y="5.08" length="middle" rot="R180"/>
<pin name="+VIN" x="-5.08" y="22.86" visible="pin" length="middle"/>
<pin name="-VIN" x="-5.08" y="7.62" length="middle"/>
<text x="2.54" y="27.94" size="1.27" layer="94">&gt;NAME</text>
<text x="25.4" y="27.94" size="1.27" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="TSR2">
<wire x1="0" y1="0" x2="0" y2="15.24" width="0.254" layer="94"/>
<wire x1="0" y1="15.24" x2="20.32" y2="15.24" width="0.254" layer="94"/>
<wire x1="20.32" y1="15.24" x2="20.32" y2="0" width="0.254" layer="94"/>
<wire x1="20.32" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<pin name="VIN" x="-5.08" y="7.62" length="middle"/>
<pin name="GND" x="10.16" y="-5.08" length="middle" rot="R90"/>
<pin name="VOUT" x="25.4" y="7.62" length="middle" rot="R180"/>
<text x="0" y="17.78" size="1.27" layer="94">&gt;NAME</text>
<text x="10.16" y="17.78" size="1.27" layer="94">&gt;VALUE</text>
</symbol>
<symbol name="LT1461">
<wire x1="-10.16" y1="-7.62" x2="-10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="-10.16" y1="7.62" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="7.62" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="-10.16" y2="-7.62" width="0.254" layer="94"/>
<pin name="VIN" x="-15.24" y="2.54" length="middle" direction="pwr"/>
<pin name="GND" x="0" y="-12.7" length="middle" direction="pwr" rot="R90"/>
<pin name="VOUT" x="15.24" y="0" length="middle" direction="pwr" rot="R180"/>
<text x="-10.16" y="10.16" size="1.27" layer="94">&gt;NAME</text>
<text x="0" y="10.16" size="1.27" layer="94">&gt;VALUE</text>
<pin name="/SHDN" x="-15.24" y="-2.54" length="middle"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TEL-15" uservalue="yes">
<gates>
<gate name="G$1" symbol="TEL-15" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TEL-15">
<connects>
<connect gate="G$1" pin="+VIN" pad="1"/>
<connect gate="G$1" pin="+VOUT" pad="3"/>
<connect gate="G$1" pin="-VIN" pad="2"/>
<connect gate="G$1" pin="-VOUT" pad="5"/>
<connect gate="G$1" pin="COMMON" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TEL-5-SINGLE" uservalue="yes">
<gates>
<gate name="G$1" symbol="TEL-5-SINGLE" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TEL-5-SINGLE">
<connects>
<connect gate="G$1" pin="+VIN" pad="23"/>
<connect gate="G$1" pin="+VIN1" pad="22"/>
<connect gate="G$1" pin="+VOUT" pad="14"/>
<connect gate="G$1" pin="-VIN" pad="2"/>
<connect gate="G$1" pin="-VIN1" pad="3"/>
<connect gate="G$1" pin="-VOUT" pad="16"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TSR2" uservalue="yes">
<gates>
<gate name="G$1" symbol="TSR2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TSR2">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="VIN" pad="1"/>
<connect gate="G$1" pin="VOUT" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LT1461" uservalue="yes">
<gates>
<gate name="G$1" symbol="LT1461" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SO8">
<connects>
<connect gate="G$1" pin="/SHDN" pad="3"/>
<connect gate="G$1" pin="GND" pad="4"/>
<connect gate="G$1" pin="VIN" pad="2"/>
<connect gate="G$1" pin="VOUT" pad="6"/>
</connects>
<technologies>
<technology name=""/>
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
<symbol name="VCC">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
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
<deviceset name="VCC" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="VCC" symbol="VCC" x="0" y="0"/>
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
<library name="con-phoenix-508">
<description>&lt;b&gt;Phoenix Connectors&lt;/b&gt;&lt;p&gt;
Grid 5.08 mm&lt;p&gt;
Based on the previous libraries:
&lt;ul&gt;
&lt;li&gt;pho508a.lbr
&lt;li&gt;pho508b.lbr
&lt;li&gt;pho508c.lbr
&lt;li&gt;pho508d.lbr
&lt;li&gt;pho508e.lbr
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="MKDSN1,5/3-5,08">
<description>&lt;b&gt;MKDSN 1,5/ 3-5,08&lt;/b&gt; Printklemme&lt;p&gt;
Nennstrom: 13,5 A&lt;br&gt;
Nennspannung: 250 V&lt;br&gt;
Rastermaß: 5,08 mm&lt;br&gt;
Polzahl: 3&lt;br&gt;
Anschlussart: Schraubanschluss&lt;br&gt;
Montage: Löten&lt;br&gt;
Anschlussrichtung Leiter/Platine: 0 °&lt;br&gt;
Artikelnummer: 1729131&lt;br&gt;
Source: http://eshop.phoenixcontact.com .. 1729131.pdf</description>
<wire x1="-10.1811" y1="-4.05" x2="5.0589" y2="-4.05" width="0.2032" layer="21"/>
<wire x1="-10.1811" y1="2.5243" x2="5.0589" y2="2.5243" width="0.2032" layer="21"/>
<wire x1="-7.8011" y1="-0.63" x2="-8.7141" y2="-1.543" width="0.2032" layer="51"/>
<wire x1="-10.1811" y1="-1.9555" x2="-10.1811" y2="-2.4479" width="0.2032" layer="21"/>
<wire x1="-10.1811" y1="-3.327" x2="-10.3098" y2="-3.327" width="0.2032" layer="21"/>
<wire x1="-10.3098" y1="-2.913" x2="-10.1811" y2="-2.913" width="0.2032" layer="21"/>
<wire x1="-10.1811" y1="-3.1279" x2="-10.1811" y2="-2.913" width="0.2032" layer="21"/>
<wire x1="-10.1811" y1="-3.327" x2="-10.1811" y2="-3.1279" width="0.2032" layer="21"/>
<wire x1="-10.7511" y1="-2.763" x2="-10.4881" y2="-2.763" width="0.2032" layer="21"/>
<wire x1="-10.7511" y1="-3.477" x2="-10.4881" y2="-3.477" width="0.2032" layer="21"/>
<wire x1="-10.1811" y1="-2.913" x2="-10.1811" y2="-2.4479" width="0.2032" layer="21"/>
<wire x1="-10.3098" y1="-3.327" x2="-10.4881" y2="-3.477" width="0.2032" layer="21"/>
<wire x1="-10.7511" y1="-2.763" x2="-10.7511" y2="-3.477" width="0.2032" layer="21"/>
<wire x1="-10.1811" y1="2.5243" x2="-10.1811" y2="2.0413" width="0.2032" layer="21"/>
<wire x1="-10.1811" y1="-1.9555" x2="-10.1811" y2="2.0413" width="0.2032" layer="21"/>
<wire x1="-10.4881" y1="-2.763" x2="-10.3098" y2="-2.913" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-2.4479" x2="-10.1811" y2="-2.4479" width="0.2032" layer="21"/>
<wire x1="-7.6411" y1="-0.47" x2="-7.8011" y2="-0.63" width="0.2032" layer="51"/>
<wire x1="-8.2801" y1="-0.119" x2="-7.6411" y2="0.52" width="0.2032" layer="51"/>
<wire x1="-9.2091" y1="-1.048" x2="-8.2801" y2="-0.119" width="0.2032" layer="51"/>
<wire x1="-4.1291" y1="-1.048" x2="-3.2001" y2="-0.119" width="0.2032" layer="51"/>
<wire x1="5.0589" y1="-1.9555" x2="5.0589" y2="-2.4479" width="0.2032" layer="21"/>
<wire x1="-2.7211" y1="-0.63" x2="-3.6341" y2="-1.543" width="0.2032" layer="51"/>
<wire x1="0.9509" y1="-1.048" x2="1.8799" y2="-0.119" width="0.2032" layer="51"/>
<wire x1="2.3589" y1="-0.63" x2="1.4459" y2="-1.543" width="0.2032" layer="51"/>
<wire x1="-3.2001" y1="-0.119" x2="-2.5611" y2="0.52" width="0.2032" layer="51"/>
<wire x1="-2.5611" y1="-0.47" x2="-2.7211" y2="-0.63" width="0.2032" layer="51"/>
<wire x1="-0.9931" y1="1.098" x2="-1.9311" y2="0.16" width="0.2032" layer="51"/>
<wire x1="4.0869" y1="1.098" x2="3.1489" y2="0.16" width="0.2032" layer="51"/>
<wire x1="-2.4421" y1="0.639" x2="-1.4881" y2="1.593" width="0.2032" layer="51"/>
<wire x1="2.6379" y1="0.639" x2="3.5919" y2="1.593" width="0.2032" layer="51"/>
<wire x1="2.5189" y1="0.52" x2="2.6379" y2="0.639" width="0.2032" layer="51"/>
<wire x1="1.8799" y1="-0.119" x2="2.5189" y2="0.52" width="0.2032" layer="51"/>
<wire x1="-1.9311" y1="0.16" x2="-2.5611" y2="-0.47" width="0.2032" layer="51"/>
<wire x1="-2.5611" y1="0.52" x2="-2.4421" y2="0.639" width="0.2032" layer="51"/>
<wire x1="3.1489" y1="0.16" x2="2.5189" y2="-0.47" width="0.2032" layer="51"/>
<wire x1="2.5189" y1="-0.47" x2="2.3589" y2="-0.63" width="0.2032" layer="51"/>
<wire x1="-7.0111" y1="0.16" x2="-7.6411" y2="-0.47" width="0.2032" layer="51"/>
<wire x1="-7.6411" y1="0.52" x2="-7.5221" y2="0.639" width="0.2032" layer="51"/>
<wire x1="-7.5221" y1="0.639" x2="-6.5681" y2="1.593" width="0.2032" layer="51"/>
<wire x1="-6.0731" y1="1.098" x2="-7.0111" y2="0.16" width="0.2032" layer="51"/>
<wire x1="-10.1811" y1="-3.1279" x2="5.0589" y2="-3.1279" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-3.1279" x2="5.0589" y2="-2.4479" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-1.9555" x2="5.0589" y2="2.0413" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="2.5243" x2="5.0589" y2="2.0413" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="2.5243" x2="5.0589" y2="4.05" width="0.2032" layer="21"/>
<wire x1="-10.1811" y1="-3.75" x2="-10.1811" y2="-3.327" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-3.75" x2="5.0589" y2="-3.1279" width="0.2032" layer="21"/>
<wire x1="-10.1811" y1="4.05" x2="5.0589" y2="4.05" width="0.2032" layer="21"/>
<wire x1="-10.1811" y1="2.5243" x2="-10.1811" y2="4.05" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-3.75" x2="-10.1811" y2="-3.75" width="0.2032" layer="21"/>
<wire x1="-10.1811" y1="-3.75" x2="-10.1811" y2="-4.05" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-3.75" x2="5.0589" y2="-4.05" width="0.2032" layer="21"/>
<wire x1="-8.2801" y1="-0.119" x2="-7.8011" y2="-0.63" width="0.2032" layer="51" curve="65.201851"/>
<wire x1="-3.2001" y1="-0.119" x2="-2.7211" y2="-0.63" width="0.2032" layer="51" curve="65.201851"/>
<wire x1="3.1489" y1="0.16" x2="2.6379" y2="0.639" width="0.2032" layer="51" curve="65.201851"/>
<wire x1="-1.9311" y1="0.16" x2="-2.4421" y2="0.639" width="0.2032" layer="51" curve="65.201851"/>
<wire x1="1.8799" y1="-0.119" x2="2.3589" y2="-0.63" width="0.2032" layer="51" curve="65.201851"/>
<wire x1="-7.0111" y1="0.16" x2="-7.5221" y2="0.639" width="0.2032" layer="51" curve="65.201851"/>
<circle x="-7.6411" y="0.025" radius="1.915" width="0.2032" layer="21"/>
<circle x="-2.5611" y="0.025" radius="1.915" width="0.2032" layer="21"/>
<circle x="2.5189" y="0.025" radius="1.915" width="0.2032" layer="21"/>
<pad name="1" x="-7.6411" y="0.025" drill="1.3" diameter="2"/>
<pad name="2" x="-2.5611" y="0.025" drill="1.3" diameter="2"/>
<pad name="3" x="2.5189" y="0.025" drill="1.3" diameter="2"/>
<text x="-9.8311" y="4.445" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.81" y="4.445" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MKDSN1,5/2-5,08">
<description>&lt;b&gt;MKDSN 1,5/ 2-5,08&lt;/b&gt; Printklemme&lt;p&gt;
Nennstrom: 13,5 A&lt;br&gt;
Nennspannung: 250 V&lt;br&gt;
Rastermaß: 5,08 mm&lt;br&gt;
Polzahl: 2&lt;br&gt;
Anschlussart: Schraubanschluss&lt;br&gt;
Montage: Löten&lt;br&gt;
Anschlussrichtung Leiter/Platine: 0 °&lt;br&gt;
Artikelnummer: 1729128&lt;br&gt;
Source: http://eshop.phoenixcontact.com .. 1729128.pdf</description>
<wire x1="-5.1011" y1="-4.05" x2="5.0589" y2="-4.05" width="0.2032" layer="21"/>
<wire x1="-5.1011" y1="2.5243" x2="5.0589" y2="2.5243" width="0.2032" layer="21"/>
<wire x1="-2.7211" y1="-0.63" x2="-3.6341" y2="-1.543" width="0.2032" layer="51"/>
<wire x1="-5.1011" y1="-1.9555" x2="-5.1011" y2="-2.4479" width="0.2032" layer="21"/>
<wire x1="-5.1011" y1="-3.327" x2="-5.2298" y2="-3.327" width="0.2032" layer="21"/>
<wire x1="-5.2298" y1="-2.913" x2="-5.1011" y2="-2.913" width="0.2032" layer="21"/>
<wire x1="-5.1011" y1="-3.1279" x2="-5.1011" y2="-2.913" width="0.2032" layer="21"/>
<wire x1="-5.1011" y1="-3.327" x2="-5.1011" y2="-3.1279" width="0.2032" layer="21"/>
<wire x1="-5.6711" y1="-2.763" x2="-5.4081" y2="-2.763" width="0.2032" layer="21"/>
<wire x1="-5.6711" y1="-3.477" x2="-5.4081" y2="-3.477" width="0.2032" layer="21"/>
<wire x1="-5.1011" y1="-2.913" x2="-5.1011" y2="-2.4479" width="0.2032" layer="21"/>
<wire x1="-5.2298" y1="-3.327" x2="-5.4081" y2="-3.477" width="0.2032" layer="21"/>
<wire x1="-5.6711" y1="-2.763" x2="-5.6711" y2="-3.477" width="0.2032" layer="21"/>
<wire x1="-5.1011" y1="2.5243" x2="-5.1011" y2="2.0413" width="0.2032" layer="21"/>
<wire x1="-5.1011" y1="-1.9555" x2="-5.1011" y2="2.0413" width="0.2032" layer="21"/>
<wire x1="-5.4081" y1="-2.763" x2="-5.2298" y2="-2.913" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-2.4479" x2="-5.1011" y2="-2.4479" width="0.2032" layer="21"/>
<wire x1="-2.5611" y1="-0.47" x2="-2.7211" y2="-0.63" width="0.2032" layer="51"/>
<wire x1="-3.2001" y1="-0.119" x2="-2.5611" y2="0.52" width="0.2032" layer="51"/>
<wire x1="-4.1291" y1="-1.048" x2="-3.2001" y2="-0.119" width="0.2032" layer="51"/>
<wire x1="0.9509" y1="-1.048" x2="1.8799" y2="-0.119" width="0.2032" layer="51"/>
<wire x1="5.0589" y1="-1.9555" x2="5.0589" y2="-2.4479" width="0.2032" layer="21"/>
<wire x1="2.3589" y1="-0.63" x2="1.4459" y2="-1.543" width="0.2032" layer="51"/>
<wire x1="1.8799" y1="-0.119" x2="2.5189" y2="0.52" width="0.2032" layer="51"/>
<wire x1="2.5189" y1="-0.47" x2="2.3589" y2="-0.63" width="0.2032" layer="51"/>
<wire x1="4.0869" y1="1.098" x2="3.1489" y2="0.16" width="0.2032" layer="51"/>
<wire x1="2.6379" y1="0.639" x2="3.5919" y2="1.593" width="0.2032" layer="51"/>
<wire x1="3.1489" y1="0.16" x2="2.5189" y2="-0.47" width="0.2032" layer="51"/>
<wire x1="2.5189" y1="0.52" x2="2.6379" y2="0.639" width="0.2032" layer="51"/>
<wire x1="-1.9311" y1="0.16" x2="-2.5611" y2="-0.47" width="0.2032" layer="51"/>
<wire x1="-2.5611" y1="0.52" x2="-2.4421" y2="0.639" width="0.2032" layer="51"/>
<wire x1="-2.4421" y1="0.639" x2="-1.4881" y2="1.593" width="0.2032" layer="51"/>
<wire x1="-0.9931" y1="1.098" x2="-1.9311" y2="0.16" width="0.2032" layer="51"/>
<wire x1="-5.1011" y1="-3.1279" x2="5.0589" y2="-3.1279" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-3.1279" x2="5.0589" y2="-2.4479" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-1.9555" x2="5.0589" y2="2.0413" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="2.5243" x2="5.0589" y2="2.0413" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="2.5243" x2="5.0589" y2="4.05" width="0.2032" layer="21"/>
<wire x1="-5.1011" y1="-3.75" x2="-5.1011" y2="-3.327" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-3.75" x2="5.0589" y2="-3.1279" width="0.2032" layer="21"/>
<wire x1="-5.1011" y1="4.05" x2="5.0589" y2="4.05" width="0.2032" layer="21"/>
<wire x1="-5.1011" y1="2.5243" x2="-5.1011" y2="4.05" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-3.75" x2="-5.1011" y2="-3.75" width="0.2032" layer="21"/>
<wire x1="-5.1011" y1="-3.75" x2="-5.1011" y2="-4.05" width="0.2032" layer="21"/>
<wire x1="5.0589" y1="-3.75" x2="5.0589" y2="-4.05" width="0.2032" layer="21"/>
<wire x1="-3.2001" y1="-0.119" x2="-2.7211" y2="-0.63" width="0.2032" layer="51" curve="65.201851"/>
<wire x1="1.8799" y1="-0.119" x2="2.3589" y2="-0.63" width="0.2032" layer="51" curve="65.201851"/>
<wire x1="3.1489" y1="0.16" x2="2.6379" y2="0.639" width="0.2032" layer="51" curve="65.201851"/>
<wire x1="-1.9311" y1="0.16" x2="-2.4421" y2="0.639" width="0.2032" layer="51" curve="65.201851"/>
<circle x="-2.5611" y="0.025" radius="1.915" width="0.2032" layer="21"/>
<circle x="2.5189" y="0.025" radius="1.915" width="0.2032" layer="21"/>
<pad name="1" x="-2.5611" y="0.025" drill="1.3" diameter="2"/>
<pad name="2" x="2.5189" y="0.025" drill="1.3" diameter="2"/>
<text x="-4.7511" y="4.445" size="1.27" layer="25">&gt;NAME</text>
<text x="6.985" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="KLV">
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<text x="3.048" y="-0.889" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-3.683" size="1.778" layer="96">&gt;VALUE</text>
<pin name="KL" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="KL">
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<circle x="1.27" y="0" radius="1.27" width="0.254" layer="94"/>
<text x="3.048" y="-0.889" size="1.778" layer="95">&gt;NAME</text>
<pin name="KL" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MKDSN1,5/3-5,08" prefix="X">
<description>&lt;b&gt;MKDSN 1,5/ 3-5,08&lt;/b&gt; Printklemme&lt;p&gt;
Nennstrom: 13,5 A&lt;br&gt;
Nennspannung: 250 V&lt;br&gt;
Rastermaß: 5,08 mm&lt;br&gt;
Polzahl: 3&lt;br&gt;
Anschlussart: Schraubanschluss&lt;br&gt;
Montage: Löten&lt;br&gt;
Anschlussrichtung Leiter/Platine: 0 °&lt;br&gt;
Artikelnummer: 1729131&lt;br&gt;
Source: http://eshop.phoenixcontact.com .. 1729131.pdf</description>
<gates>
<gate name="-1" symbol="KLV" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="KL" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="KL" x="0" y="-10.16" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="MKDSN1,5/3-5,08">
<connects>
<connect gate="-1" pin="KL" pad="1"/>
<connect gate="-2" pin="KL" pad="2"/>
<connect gate="-3" pin="KL" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MKDSN1,5/2-5,08" prefix="X">
<description>&lt;b&gt;MKDSN 1,5/ 2-5,08&lt;/b&gt; Printklemme&lt;p&gt;
Nennstrom: 13,5 A&lt;br&gt;
Nennspannung: 250 V&lt;br&gt;
Rastermaß: 5,08 mm&lt;br&gt;
Polzahl: 2&lt;br&gt;
Anschlussart: Schraubanschluss&lt;br&gt;
Montage: Löten&lt;br&gt;
Anschlussrichtung Leiter/Platine: 0 °&lt;br&gt;
Artikelnummer: 1729128&lt;br&gt;
Source: http://eshop.phoenixcontact.com .. 1729128.pdf</description>
<gates>
<gate name="-1" symbol="KLV" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="KLV" x="0" y="-5.08" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="MKDSN1,5/2-5,08">
<connects>
<connect gate="-1" pin="KL" pad="1"/>
<connect gate="-2" pin="KL" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-phoenix-350">
<description>&lt;b&gt;Phoenix Connectors&lt;/b&gt; Grid 3.50 mm&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1751251">
<description>&lt;b&gt;MKDS 1/ 3-3,5&lt;/b&gt; Printklemme&lt;p&gt;
Nennstrom: 10 A&lt;br&gt;
Bemessungsspannung: 160 V&lt;br&gt;
Raster: 3,5 mm&lt;br&gt;
Polzahl: 3&lt;br&gt;
Montageart: Löten&lt;br&gt;
Anschlussart: Schraubanschluss&lt;br&gt;
Anschlussrichtung vom Leiter zur Platine: 0°&lt;br&gt;
Source: http://eshop.phoenixcontact.com .. 1751251.pdf</description>
<wire x1="-5.5" y1="3.65" x2="5.5" y2="3.65" width="0.1016" layer="21"/>
<wire x1="-5.5" y1="3.65" x2="-5.5" y2="1.9123" width="0.1016" layer="21"/>
<wire x1="5.5" y1="-2.0993" x2="-5.5" y2="-2.0993" width="0.1016" layer="21"/>
<wire x1="5.5" y1="-1.6163" x2="5.5" y2="1.4367" width="0.1016" layer="21"/>
<wire x1="5.5" y1="-2.0993" x2="5.5" y2="-2.911" width="0.1016" layer="21"/>
<wire x1="5.5" y1="-1.6163" x2="5.5" y2="-2.0993" width="0.1016" layer="21"/>
<wire x1="-5.5" y1="1.9123" x2="-5.5" y2="1.4367" width="0.1016" layer="21"/>
<wire x1="-5.5" y1="1.9123" x2="5.5" y2="1.9123" width="0.1016" layer="21"/>
<wire x1="5.5" y1="1.4367" x2="5.5" y2="1.9123" width="0.1016" layer="21"/>
<wire x1="-5.5" y1="-1.6163" x2="-5.5" y2="1.4367" width="0.1016" layer="21"/>
<wire x1="5.5" y1="1.4367" x2="-5.5" y2="1.4367" width="0.1016" layer="21"/>
<wire x1="-5.5" y1="-1.6163" x2="5.5" y2="-1.6163" width="0.1016" layer="21"/>
<wire x1="5.5" y1="3.65" x2="5.5" y2="1.9123" width="0.1016" layer="21"/>
<wire x1="-5.5" y1="-1.6163" x2="-5.5" y2="-2.0993" width="0.1016" layer="21"/>
<wire x1="-5.5" y1="-2.0993" x2="-5.5" y2="-2.911" width="0.1016" layer="21"/>
<wire x1="-4.706" y1="-0.811" x2="-2.789" y2="1.106" width="0.1016" layer="51"/>
<wire x1="5.5" y1="-2.911" x2="-5.5" y2="-2.911" width="0.1016" layer="21"/>
<wire x1="-5.5" y1="-3.65" x2="5.5" y2="-3.65" width="0.1016" layer="21"/>
<wire x1="5.5" y1="-3.35" x2="5.5" y2="-3.65" width="0.1016" layer="21"/>
<wire x1="-5.5" y1="-3.35" x2="5.5" y2="-3.35" width="0.1016" layer="21"/>
<wire x1="-5.5" y1="-3.35" x2="-5.5" y2="-3.65" width="0.1016" layer="21"/>
<wire x1="-5.5" y1="-2.911" x2="-5.5" y2="-3.35" width="0.1016" layer="21"/>
<wire x1="5.5" y1="-2.911" x2="5.5" y2="-3.35" width="0.1016" layer="21"/>
<wire x1="-2.294" y1="0.611" x2="-2.3" y2="0.605" width="0.1016" layer="21"/>
<wire x1="-2.3" y1="0.605" x2="-4.211" y2="-1.306" width="0.1016" layer="51"/>
<wire x1="-1.206" y1="-0.811" x2="0.711" y2="1.106" width="0.1016" layer="51"/>
<wire x1="1.206" y1="0.611" x2="1.2" y2="0.605" width="0.1016" layer="21"/>
<wire x1="1.2" y1="0.605" x2="-0.711" y2="-1.306" width="0.1016" layer="51"/>
<wire x1="2.294" y1="-0.811" x2="4.211" y2="1.106" width="0.1016" layer="51"/>
<wire x1="4.706" y1="0.611" x2="4.7" y2="0.605" width="0.1016" layer="21"/>
<wire x1="4.7" y1="0.605" x2="2.789" y2="-1.306" width="0.1016" layer="51"/>
<circle x="-3.5" y="-0.1" radius="1.45" width="0.1016" layer="21"/>
<circle x="0" y="-0.1" radius="1.45" width="0.1016" layer="21"/>
<circle x="3.5" y="-0.1" radius="1.45" width="0.1016" layer="21"/>
<pad name="1" x="-3.5" y="-0.1" drill="1.1" diameter="1.7" rot="R90"/>
<pad name="2" x="0" y="-0.1" drill="1.1" diameter="1.7" rot="R90"/>
<pad name="3" x="3.5" y="-0.1" drill="1.1" diameter="1.7" rot="R90"/>
<text x="-3.95" y="2.2225" size="1.27" layer="21" font="vector">1</text>
<text x="-0.4575" y="2.2225" size="1.27" layer="21" font="vector">2</text>
<text x="3.035" y="2.2225" size="1.27" layer="21" font="vector">3</text>
<text x="-5.855" y="-2.8575" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="-3.8025" y="4.1275" size="1.27" layer="27">&gt;VALUE</text>
<polygon width="0.1016" layer="21">
<vertex x="-4.9025" y="-2.8575"/>
<vertex x="-5.22" y="-2.2225"/>
<vertex x="-4.585" y="-2.2225"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="SCHRAUBKLEMME">
<wire x1="0" y1="-1.27" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="12.7" y1="-1.27" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="12.7" y1="-1.27" x2="12.7" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="12.7" y2="1.27" width="0.254" layer="94"/>
<circle x="11.43" y="0" radius="0.6839" width="0.254" layer="94"/>
<text x="1.27" y="-0.889" size="1.778" layer="95">&gt;NAME</text>
<text x="13.97" y="-0.889" size="1.778" layer="96">&gt;VALUE</text>
<pin name="K" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="1751251" prefix="X">
<description>&lt;b&gt;MKDS 1/ 3-3,5&lt;/b&gt; Printklemme&lt;p&gt;
Nennstrom: 10 A&lt;br&gt;
Bemessungsspannung: 160 V&lt;br&gt;
Raster: 3,5 mm&lt;br&gt;
Polzahl: 3&lt;br&gt;
Montageart: Löten&lt;br&gt;
Anschlussart: Schraubanschluss&lt;br&gt;
Anschlussrichtung vom Leiter zur Platine: 0°&lt;br&gt;
Source: http://eshop.phoenixcontact.com .. 1751251.pdf</description>
<gates>
<gate name="-1" symbol="SCHRAUBKLEMME" x="0" y="0" addlevel="always"/>
<gate name="-2" symbol="SCHRAUBKLEMME" x="0" y="-7.62" addlevel="always"/>
<gate name="-3" symbol="SCHRAUBKLEMME" x="0" y="-15.24" addlevel="always"/>
</gates>
<devices>
<device name="" package="1751251">
<connects>
<connect gate="-1" pin="K" pad="1"/>
<connect gate="-2" pin="K" pad="2"/>
<connect gate="-3" pin="K" pad="3"/>
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
<library name="linear">
<description>&lt;b&gt;Linear Devices&lt;/b&gt;&lt;p&gt;
Operational amplifiers,  comparators, voltage regulators, ADCs, DACs, etc.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="TO92">
<description>&lt;b&gt;TO-92&lt;/b&gt;</description>
<wire x1="-2.095" y1="-1.651" x2="-0.7869" y2="2.5484" width="0.1524" layer="21" curve="-111.097684"/>
<wire x1="0.7869" y1="2.5484" x2="2.095" y2="-1.651" width="0.1524" layer="21" curve="-111.097684"/>
<wire x1="-2.095" y1="-1.651" x2="2.095" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-2.254" y1="-0.254" x2="-0.286" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-2.655" y1="-0.254" x2="-2.254" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-0.286" y1="-0.254" x2="0.286" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="2.254" y1="-0.254" x2="2.655" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="0.286" y1="-0.254" x2="2.254" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-0.7864" y1="2.5484" x2="0.7864" y2="2.5484" width="0.1524" layer="51" curve="-34.298964"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="0" y="1.905" drill="0.8128" shape="octagon"/>
<pad name="3" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="2.413" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="2.921" y="-1.27" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TO220H">
<description>&lt;b&gt;TO-220&lt;/b&gt;</description>
<wire x1="-5.207" y1="-7.62" x2="5.207" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="5.207" y1="8.255" x2="-5.207" y2="8.255" width="0.1524" layer="21"/>
<wire x1="5.207" y1="-7.62" x2="5.207" y2="4.826" width="0.1524" layer="21"/>
<wire x1="5.207" y1="4.826" x2="4.318" y2="4.826" width="0.1524" layer="21"/>
<wire x1="4.318" y1="4.826" x2="4.318" y2="6.35" width="0.1524" layer="21"/>
<wire x1="4.318" y1="6.35" x2="5.207" y2="6.35" width="0.1524" layer="21"/>
<wire x1="5.207" y1="6.35" x2="5.207" y2="8.255" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="-7.62" x2="-5.207" y2="4.826" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="4.826" x2="-4.318" y2="4.826" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="4.826" x2="-4.318" y2="6.35" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="6.35" x2="-5.207" y2="6.35" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="6.35" x2="-5.207" y2="8.255" width="0.1524" layer="21"/>
<wire x1="-4.572" y1="-6.985" x2="4.572" y2="-6.985" width="0.0508" layer="21"/>
<wire x1="4.572" y1="1.27" x2="4.572" y2="-6.985" width="0.0508" layer="21"/>
<wire x1="4.572" y1="1.27" x2="-4.572" y2="1.27" width="0.0508" layer="21"/>
<wire x1="-4.572" y1="-6.985" x2="-4.572" y2="1.27" width="0.0508" layer="21"/>
<circle x="0" y="4.826" radius="1.8034" width="0.1524" layer="21"/>
<circle x="0" y="4.826" radius="2.54" width="0" layer="43"/>
<circle x="0" y="4.826" radius="2.54" width="0" layer="42"/>
<pad name="1" x="-2.54" y="-10.16" drill="1.1176" shape="long" rot="R90"/>
<pad name="2" x="0" y="-10.16" drill="1.1176" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-10.16" drill="1.1176" shape="long" rot="R90"/>
<text x="-5.461" y="-10.922" size="1.778" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="7.366" y="-11.049" size="1.778" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="2.159" y1="-11.049" x2="2.921" y2="-10.414" layer="21"/>
<rectangle x1="-0.381" y1="-11.049" x2="0.381" y2="-10.414" layer="21"/>
<rectangle x1="-2.921" y1="-11.049" x2="-2.159" y2="-10.414" layer="21"/>
<rectangle x1="-3.175" y1="-10.414" x2="-1.905" y2="-7.62" layer="21"/>
<rectangle x1="-0.635" y1="-10.414" x2="0.635" y2="-7.62" layer="21"/>
<rectangle x1="1.905" y1="-10.414" x2="3.175" y2="-7.62" layer="21"/>
<hole x="0" y="4.826" drill="3.302"/>
</package>
<package name="TO39">
<description>&lt;b&gt;Metal Can Package&lt;/b&gt;</description>
<wire x1="-4.0386" y1="-3.5306" x2="-3.5052" y2="-2.9972" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="-3.5306" x2="-3.5052" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="-3.5052" y1="-4.064" x2="-4.0386" y2="-3.5306" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="4.572" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="3.8608" width="0.0508" layer="21"/>
<pad name="1" x="0" y="-2.54" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="3" x="0" y="2.54" drill="0.8128" shape="octagon"/>
<text x="-2.794" y="4.826" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.302" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TO252">
<description>&lt;b&gt;SMALL OUTLINE TRANSISTOR&lt;/b&gt;&lt;p&gt;
TS-003</description>
<wire x1="3.2766" y1="3.8354" x2="3.277" y2="-2.159" width="0.2032" layer="21"/>
<wire x1="3.277" y1="-2.159" x2="-3.277" y2="-2.159" width="0.2032" layer="21"/>
<wire x1="-3.277" y1="-2.159" x2="-3.2766" y2="3.8354" width="0.2032" layer="21"/>
<wire x1="-3.277" y1="3.835" x2="3.2774" y2="3.8346" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="3.937" x2="-2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="4.6482" x2="-2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="-2.1082" y1="5.1054" x2="2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="2.1082" y1="5.1054" x2="2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="4.6482" x2="2.5654" y2="3.937" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="3.937" x2="-2.5654" y2="3.937" width="0.2032" layer="51"/>
<smd name="3" x="0" y="2.5" dx="5.4" dy="6.2" layer="1"/>
<smd name="1" x="-2.28" y="-4.8" dx="1" dy="1.6" layer="1"/>
<smd name="2" x="2.28" y="-4.8" dx="1" dy="1.6" layer="1"/>
<text x="-3.81" y="-2.54" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.7178" y1="-5.1562" x2="-1.8542" y2="-2.2606" layer="51"/>
<rectangle x1="1.8542" y1="-5.1562" x2="2.7178" y2="-2.2606" layer="51"/>
<rectangle x1="-0.4318" y1="-3.0226" x2="0.4318" y2="-2.2606" layer="21"/>
<polygon width="0.1998" layer="51">
<vertex x="-2.5654" y="3.937"/>
<vertex x="-2.5654" y="4.6482"/>
<vertex x="-2.1082" y="5.1054"/>
<vertex x="2.1082" y="5.1054"/>
<vertex x="2.5654" y="4.6482"/>
<vertex x="2.5654" y="3.937"/>
</polygon>
</package>
<package name="TO220V">
<description>&lt;b&gt;TO 200 vertical&lt;/b&gt;</description>
<wire x1="5.08" y1="-1.143" x2="4.953" y2="-4.064" width="0.127" layer="21"/>
<wire x1="4.699" y1="-4.318" x2="4.953" y2="-4.064" width="0.127" layer="21"/>
<wire x1="4.699" y1="-4.318" x2="-4.699" y2="-4.318" width="0.127" layer="21"/>
<wire x1="-4.953" y1="-4.064" x2="-4.699" y2="-4.318" width="0.127" layer="21"/>
<wire x1="-4.953" y1="-4.064" x2="-5.08" y2="-1.143" width="0.127" layer="21"/>
<circle x="-4.4958" y="-3.7084" radius="0.254" width="0.127" layer="21"/>
<pad name="1" x="-2.54" y="-2.54" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="0" y="-2.54" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="2.54" y="-2.54" drill="1.016" shape="long" rot="R90"/>
<text x="-5.08" y="-6.0452" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.175" y="-3.175" size="1.27" layer="51" ratio="10">1</text>
<text x="-0.635" y="-3.175" size="1.27" layer="51" ratio="10">2</text>
<text x="1.905" y="-3.175" size="1.27" layer="51" ratio="10">3</text>
<rectangle x1="-5.334" y1="-0.762" x2="5.334" y2="0" layer="21"/>
<rectangle x1="-5.334" y1="-1.27" x2="-3.429" y2="-0.762" layer="21"/>
<rectangle x1="-1.651" y1="-1.27" x2="-0.889" y2="-0.762" layer="21"/>
<rectangle x1="-3.429" y1="-1.27" x2="-1.651" y2="-0.762" layer="51"/>
<rectangle x1="0.889" y1="-1.27" x2="1.651" y2="-0.762" layer="21"/>
<rectangle x1="3.429" y1="-1.27" x2="5.334" y2="-0.762" layer="21"/>
<rectangle x1="-0.889" y1="-1.27" x2="0.889" y2="-0.762" layer="51"/>
<rectangle x1="1.651" y1="-1.27" x2="3.429" y2="-0.762" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="78XX">
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="2.54" width="0.4064" layer="94"/>
<wire x1="7.62" y1="2.54" x2="-7.62" y2="2.54" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-7.62" y2="-5.08" width="0.4064" layer="94"/>
<text x="-7.62" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.032" y="-4.318" size="1.524" layer="95">GND</text>
<pin name="VI" x="-10.16" y="0" length="short" direction="in"/>
<pin name="GND" x="0" y="-7.62" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="VO" x="10.16" y="0" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="78*" prefix="IC">
<description>Positive &lt;b&gt;VOLTAGE REGULATOR&lt;/b&gt;&lt;p&gt;
Source:&lt;br&gt;
http://cache.national.com/ds/LM/LM78L05.pdf&lt;br&gt;
http://www.fairchildsemi.com/ds/LM/LM7805.pdf</description>
<gates>
<gate name="A1" symbol="78XX" x="0" y="0"/>
</gates>
<devices>
<device name="Z" package="TO92">
<connects>
<connect gate="A1" pin="GND" pad="2"/>
<connect gate="A1" pin="VI" pad="3"/>
<connect gate="A1" pin="VO" pad="1"/>
</connects>
<technologies>
<technology name="L05"/>
<technology name="L08"/>
<technology name="L12"/>
<technology name="L15"/>
<technology name="L18"/>
<technology name="L24"/>
</technologies>
</device>
<device name="T" package="TO220H">
<connects>
<connect gate="A1" pin="GND" pad="2"/>
<connect gate="A1" pin="VI" pad="1"/>
<connect gate="A1" pin="VO" pad="3"/>
</connects>
<technologies>
<technology name="05"/>
<technology name="06"/>
<technology name="08"/>
<technology name="12"/>
<technology name="15"/>
<technology name="18"/>
<technology name="24"/>
</technologies>
</device>
<device name="H" package="TO39">
<connects>
<connect gate="A1" pin="GND" pad="3"/>
<connect gate="A1" pin="VI" pad="1"/>
<connect gate="A1" pin="VO" pad="2"/>
</connects>
<technologies>
<technology name="05"/>
<technology name="06"/>
<technology name="08"/>
<technology name="12"/>
<technology name="15"/>
<technology name="18"/>
<technology name="24"/>
</technologies>
</device>
<device name="L" package="TO92">
<connects>
<connect gate="A1" pin="GND" pad="2"/>
<connect gate="A1" pin="VI" pad="3"/>
<connect gate="A1" pin="VO" pad="1"/>
</connects>
<technologies>
<technology name="05"/>
<technology name="06"/>
<technology name="08"/>
<technology name="12"/>
<technology name="15"/>
<technology name="18"/>
<technology name="24"/>
</technologies>
</device>
<device name="DT" package="TO252">
<connects>
<connect gate="A1" pin="GND" pad="3"/>
<connect gate="A1" pin="VI" pad="1"/>
<connect gate="A1" pin="VO" pad="2"/>
</connects>
<technologies>
<technology name="05"/>
<technology name="06"/>
<technology name="08"/>
<technology name="12"/>
<technology name="15"/>
<technology name="18"/>
<technology name="24"/>
</technologies>
</device>
<device name="TV" package="TO220V">
<connects>
<connect gate="A1" pin="GND" pad="2"/>
<connect gate="A1" pin="VI" pad="1"/>
<connect gate="A1" pin="VO" pad="3"/>
</connects>
<technologies>
<technology name="05"/>
<technology name="12"/>
<technology name="15"/>
<technology name="18"/>
<technology name="24"/>
<technology name="6"/>
<technology name="8"/>
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
<package name="BU-SMA-V">
<description>FEMALE &lt;b&gt;SMA CONNECTOR&lt;/b&gt;&lt;p&gt;
Radiall&lt;p&gt;
distributor RS 112-3794</description>
<wire x1="-1.1" y1="3.2" x2="1.1" y2="3.2" width="0.2032" layer="21"/>
<wire x1="3.2" y1="1.1" x2="3.2" y2="-1.1" width="0.2032" layer="21"/>
<wire x1="1.1" y1="-3.2" x2="-1.1" y2="-3.2" width="0.2032" layer="21"/>
<wire x1="-3.2" y1="-1.1" x2="-3.2" y2="1.1" width="0.2032" layer="21"/>
<wire x1="-3.1999" y1="3.1999" x2="3.2" y2="3.2" width="0.2032" layer="51"/>
<wire x1="3.2" y1="3.2" x2="3.1999" y2="-3.1999" width="0.2032" layer="51"/>
<wire x1="3.1999" y1="-3.1999" x2="-3.2" y2="-3.2" width="0.2032" layer="51"/>
<wire x1="-3.2" y1="-3.2" x2="-3.1999" y2="3.1999" width="0.2032" layer="51"/>
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
<deviceset name="BU-SMA-V" prefix="X">
<description>FEMALE &lt;b&gt;SMA CONNECTOR&lt;/b&gt;&lt;p&gt;
Radiall&lt;p&gt;
distributor RS 112-3794</description>
<gates>
<gate name="G$1" symbol="BNC-FGND" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="BU-SMA-V">
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
<part name="U$1" library="traco" deviceset="TEL-15" device="" value="TEL15-2422"/>
<part name="U$2" library="traco" deviceset="TEL-5-SINGLE" device="" value="TEL5-2411"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="P+1" library="supply1" deviceset="VCC" device=""/>
<part name="P+2" library="supply1" deviceset="VCC" device=""/>
<part name="U$3" library="traco" deviceset="TSR2" device="" value="TSR2-2490"/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="P+3" library="supply1" deviceset="VCC" device=""/>
<part name="X1" library="con-phoenix-508" deviceset="MKDSN1,5/3-5,08" device=""/>
<part name="X2" library="con-phoenix-508" deviceset="MKDSN1,5/2-5,08" device=""/>
<part name="X3" library="con-phoenix-350" deviceset="1751251" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="U$4" library="traco" deviceset="LT1461" device="" value="3.3V"/>
<part name="U$5" library="traco" deviceset="LT1461" device="" value="3.0V"/>
<part name="U$6" library="traco" deviceset="LT1461" device="" value="2.5V"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="IC1" library="linear" deviceset="78*" device="TV" technology="05"/>
<part name="X4" library="con-coax" deviceset="BU-SMA-V" device=""/>
<part name="X5" library="con-coax" deviceset="BU-SMA-V" device=""/>
<part name="X6" library="con-coax" deviceset="BU-SMA-V" device=""/>
<part name="X7" library="con-phoenix-508" deviceset="MKDSN1,5/2-5,08" device=""/>
<part name="P+4" library="supply1" deviceset="VCC" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="12.7" y="38.1"/>
<instance part="U$2" gate="G$1" x="12.7" y="5.08"/>
<instance part="GND1" gate="1" x="7.62" y="7.62"/>
<instance part="GND2" gate="1" x="7.62" y="38.1"/>
<instance part="P+1" gate="VCC" x="7.62" y="63.5"/>
<instance part="P+2" gate="VCC" x="7.62" y="30.48"/>
<instance part="U$3" gate="G$1" x="20.32" y="81.28"/>
<instance part="GND3" gate="1" x="30.48" y="73.66"/>
<instance part="P+3" gate="VCC" x="15.24" y="96.52"/>
<instance part="X1" gate="-1" x="60.96" y="58.42"/>
<instance part="X1" gate="-2" x="60.96" y="50.8"/>
<instance part="X1" gate="-3" x="60.96" y="43.18"/>
<instance part="X2" gate="-1" x="60.96" y="10.16"/>
<instance part="X2" gate="-2" x="60.96" y="25.4"/>
<instance part="X3" gate="-1" x="50.8" y="101.6"/>
<instance part="X3" gate="-2" x="50.8" y="78.74"/>
<instance part="X3" gate="-3" x="50.8" y="88.9"/>
<instance part="GND4" gate="1" x="48.26" y="76.2"/>
<instance part="GND5" gate="1" x="96.52" y="81.28"/>
<instance part="U$4" gate="G$1" x="154.94" y="88.9"/>
<instance part="U$5" gate="G$1" x="154.94" y="50.8"/>
<instance part="U$6" gate="G$1" x="154.94" y="15.24"/>
<instance part="GND6" gate="1" x="154.94" y="73.66"/>
<instance part="GND7" gate="1" x="154.94" y="35.56"/>
<instance part="GND8" gate="1" x="154.94" y="0"/>
<instance part="IC1" gate="A1" x="96.52" y="91.44"/>
<instance part="X4" gate="G$1" x="203.2" y="88.9" rot="R180"/>
<instance part="X5" gate="G$1" x="203.2" y="50.8" rot="R180"/>
<instance part="X6" gate="G$1" x="203.2" y="15.24" rot="R180"/>
<instance part="X7" gate="-1" x="-15.24" y="45.72" rot="R180"/>
<instance part="X7" gate="-2" x="-15.24" y="38.1" rot="R180"/>
<instance part="P+4" gate="VCC" x="-12.7" y="53.34"/>
<instance part="GND9" gate="1" x="-12.7" y="35.56"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="-VIN1"/>
<pinref part="GND1" gate="1" pin="GND"/>
<pinref part="U$2" gate="G$1" pin="-VIN"/>
<wire x1="7.62" y1="10.16" x2="7.62" y2="12.7" width="0.1524" layer="91"/>
<junction x="7.62" y="10.16"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="-VIN"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="7.62" y1="40.64" x2="7.62" y2="45.72" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$3" gate="G$1" pin="GND"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="X3" gate="-2" pin="K"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U$4" gate="G$1" pin="GND"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U$5" gate="G$1" pin="GND"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U$6" gate="G$1" pin="GND"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND5" gate="1" pin="GND"/>
<pinref part="IC1" gate="A1" pin="GND"/>
</segment>
<segment>
<pinref part="X7" gate="-2" pin="KL"/>
<pinref part="GND9" gate="1" pin="GND"/>
</segment>
</net>
<net name="VCC" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="+VIN"/>
<pinref part="P+1" gate="VCC" pin="VCC"/>
<wire x1="7.62" y1="60.96" x2="7.62" y2="55.88" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="+VIN"/>
<pinref part="P+2" gate="VCC" pin="VCC"/>
<pinref part="U$2" gate="G$1" pin="+VIN1"/>
<wire x1="7.62" y1="27.94" x2="7.62" y2="25.4" width="0.1524" layer="91"/>
<junction x="7.62" y="27.94"/>
</segment>
<segment>
<pinref part="U$3" gate="G$1" pin="VIN"/>
<pinref part="P+3" gate="VCC" pin="VCC"/>
<wire x1="15.24" y1="93.98" x2="15.24" y2="88.9" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="X7" gate="-1" pin="KL"/>
<pinref part="P+4" gate="VCC" pin="VCC"/>
<wire x1="-12.7" y1="50.8" x2="-12.7" y2="45.72" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="+VOUT"/>
<wire x1="55.88" y1="25.4" x2="58.42" y2="25.4" width="0.1524" layer="91"/>
<pinref part="X2" gate="-2" pin="KL"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="-VOUT"/>
<pinref part="X2" gate="-1" pin="KL"/>
<wire x1="58.42" y1="10.16" x2="55.88" y2="10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="-VOUT"/>
<pinref part="X1" gate="-3" pin="KL"/>
<wire x1="55.88" y1="43.18" x2="58.42" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="COMMON"/>
<pinref part="X1" gate="-2" pin="KL"/>
<wire x1="58.42" y1="50.8" x2="55.88" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="+VOUT"/>
<pinref part="X1" gate="-1" pin="KL"/>
<wire x1="58.42" y1="58.42" x2="55.88" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="U$3" gate="G$1" pin="VOUT"/>
<pinref part="X3" gate="-3" pin="K"/>
<wire x1="48.26" y1="88.9" x2="45.72" y2="88.9" width="0.1524" layer="91"/>
<wire x1="86.36" y1="91.44" x2="45.72" y2="91.44" width="0.1524" layer="91"/>
<wire x1="45.72" y1="91.44" x2="45.72" y2="88.9" width="0.1524" layer="91"/>
<pinref part="IC1" gate="A1" pin="VI"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U$4" gate="G$1" pin="VIN"/>
<wire x1="106.68" y1="91.44" x2="134.62" y2="91.44" width="0.1524" layer="91"/>
<wire x1="134.62" y1="91.44" x2="139.7" y2="91.44" width="0.1524" layer="91"/>
<wire x1="134.62" y1="91.44" x2="134.62" y2="53.34" width="0.1524" layer="91"/>
<pinref part="U$5" gate="G$1" pin="VIN"/>
<wire x1="134.62" y1="53.34" x2="139.7" y2="53.34" width="0.1524" layer="91"/>
<wire x1="134.62" y1="53.34" x2="134.62" y2="17.78" width="0.1524" layer="91"/>
<pinref part="U$6" gate="G$1" pin="VIN"/>
<wire x1="134.62" y1="17.78" x2="139.7" y2="17.78" width="0.1524" layer="91"/>
<pinref part="IC1" gate="A1" pin="VO"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U$4" gate="G$1" pin="VOUT"/>
<pinref part="X4" gate="G$1" pin="1"/>
<wire x1="200.66" y1="88.9" x2="170.18" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U$5" gate="G$1" pin="VOUT"/>
<pinref part="X5" gate="G$1" pin="1"/>
<wire x1="200.66" y1="50.8" x2="170.18" y2="50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="U$6" gate="G$1" pin="VOUT"/>
<pinref part="X6" gate="G$1" pin="1"/>
<wire x1="200.66" y1="15.24" x2="170.18" y2="15.24" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
