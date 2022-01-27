!Command file for ACSL source program, efm.csl, the Edinburgh Forest Model.
   !This command file efm.cmd is addressed automatically when model is run.
   !It provides useful short-cuts, but does not have to be used.
   !It has 68 pages in dos WP, ctrl/home gives goto page number
   !Or search down (f2) for "*************"

!Aide-memoire (used in plot command, e.g. plot LAI/type=013):
   !/type=ijk
         !PC, dos/acsl:
            !i = style, 0 solid, 1 dotted, 2 dashed;
            !j = width, 1, 2, etc;
            !k = colour. k values give:
         !PC, win/acsl
            !i = 0 solid, 1 dashed, 2 dotted, 3 dash dot, 4 dash dot dot, 
                !5 and >5, solid.
            !j doesnt do anything

            !k                          !k
            !DOS ACSL                   WinACSL (not good colours)
            !0, 1, white                blue
            !2, blue (purply)           green
            !3, green                   red
            !4, blue (light)            purply
            !5, red                     greeny
            !6, violet (magenta)        greyish
            !7, yellow                  greyish
            !8, blue (again)            purply
            !9, green (again).          grey
         !This is the order in which the colours are used in repeated runs.

!CONTENTS are mostly in proceds: eg search for "proced acslpars" or
   !search for "!acslpars." for the end of that proced.

!These are now listed (210 in all):
   ! 1. acslpars  !Display acsl parameters.
   ! 2. ps !Postscript graphs.
   ! 3. plc !Plot close (closes the postscript file so you can print it).
   ! 4. notps  !Not postscript graphs, screen graphs.
   ! 5. notext !No text on graphs.
   ! 6. oc !Clear the screen output list.
   ! 7. pc !Clear the prepar list (for printing and plotting).
   ! 8. notext !No text on plots.
   ! 9. rw    !Rewind the .rrr file. Sets nrwitg to .f. .
   ! 10. nrw (nrwitg = .t.) !No rewind see above. 
   ! 11. ncf ( f = efm.cmd ) !New command file. 
   ! 12. go (tstop = 365, cint = 365, nciout = 1) !Do a simulation.
                        !365 days is default - else eg "go 50 10" 
   ! 13. gob (tstop = 1095, cint = 1, nciout = 73) !Do a simulation for beech.
                        !3 yrs is default - else eg "gob tstop, cint". 
   ! 14. grmonthsbb (xlo = 0, xhi = month_r) !Graphs against running months,
         !bounded upper and lower. Lots of graphs.
   ! 15. grmonthsbb1 (xlo = 0, xhi = month_r) !Single plot, See 14 above. 
   ! 16. co (tstop = 730) !Continue the simulation with a no rewind.
                          !730 day is default - else eg <co 100>.
   ! 17. datetime !Display date and time.
   ! 18. test (tstop = 10, cint = 1, nciout = 10) !Do a test simulation.
   ! 19. testaphid (tstop = 10, cint = 1, nciout = 10) !Test simulation,
            !for aphids on sitka. Eskdalemuir sinusoidal climate. 
   ! 20. fec ( m_alaa_fec = 1, m_apta_fec = 1 )
         !Set aphid fecundity multipliers. eg. fec 2 2
   ! 21. testb (tstop = 730, nciout = 365) !Do a test simulation for beech.
   ! 22. test60 (tstop = 21900, cint = 365, nciout = 1) !21900 = 60 * 365.
         !Do a test simulation, sitka, 60-year rotations, with thinning.
   ! 23. testb90 (tstop = 32850, cint = 365, nciout = 10) 
         !Do a test simulation, beech, 90-year rotation, with thinning.
   ! 24. dswitches  !Display switches.
         !See also proced envpars !Environmental data parameters and switches.
   ! 25. testthin !Test thinning sections for C, N, W conservation. 
   ! 26. testthin1start !Run with a single start for testing.
         !Test thinning sections for C, N, W conservation. 
   ! 27. testrotate !Test C, N balances when completing rotations.
   ! 28. testprune ( tstop = 10 )
         !Test pruning sections for C, N, W conservation. 
   ! 29. temppars !Display temperature parameters.
   ! 30. fire (s_fire = 1) 
         !turns on/off default [severe (high intensity)] fire.
   ! 31. firepars !Fire parameters displayed.   
   ! 32. testfire (tstop = 7300)  !Fire at t = 365 to 366. eg tstop = 365.5
               !stops in the middle of the fire.
               !Halfway through the fire beginning next year 1 Jan, 0 h.
   ! 33. grtestfire (xlo = 364, xhi = 366) 
   ! 34. beech !Use to display sitka parameter values and reset for beech
   ! 35. deciduous !Deciduous mode. No change in parameter values. 
   ! 36. quasibeech !For running Sitka, but using many beech parameters, 
   ! 37. dbeech !Display beech parameter values. No change in values
   ! 38. sitka !Display current parameters and reset to Sitka default values. 
   ! 39. dfert !Display fertilizer parameters.
   ! 40. sfert1 !Set 1 fertilizer application. 
   ! 41. sfert0 !Set 0 fertilizer application.  
   ! 42. gofert !Fertilizer runs.
   ! 43. gr1yrYr ( Y = jPARsc, run = 1 ) !Graph over 1st year, vs months. 
   ! 44. gryr ( Y = jPARdy ) !Graph over years.
   ! 45. otreevrs !Output tree variables.
   ! 46. onstems !nstems output list.   
   ! 47. treechk
   ! 48. treeCfluxes !Tree C fluxes. 
   ! 49. Ctreechk !Check C in tree compartments.
   ! 50. Ntreechk !Check N in tree compartments.
   ! 51. Wtreechk !Check W in tree compartments. 
   ! 52. checks !Checks accounting for C, N, W (water) in system and
              !main components, tree, soil (inc. litter), products, aphids.
   ! 53. chks !Other checks.
   ! 54. Mtree !Display cpts of Mtree, all kg stem-1.
   ! 55. DNsys !LHS variables of eqn " DNsys = ", units variable.
   ! 56. lichecks !Checks accounting for C, N in litter. 
   ! 57. litterya !Litter yearly averages. 
   ! 58. checkio !Check inputs and outputs to system and submodels.
   ! 59. latitude (latitude_degc = 55.27) !default is eskdalemuir.
   ! 60. gocalendar !Defaults applied, else comment out restore statement  
   ! 61. grcalendar !Plots for current calendar settings, 
   ! 62. prfcalendar (f = calendar.dat) !Print to file. 
   ! 63. Nfluxes !Display N fluxes. 
   ! 64. mai !Maintenance, display only.  
   ! 65. Namm !Display only.
   ! 66. Nnit !Display only.
   ! 67. ONamm_rt !Display only.
   ! 68. dNsysya  !Display components of dNsysya.
   ! 69. dstop !Display stop conditions, i.e. why run stopped:

   ! 70. vr (vr = 1) !This proced switches tree, soil and litter variables,
                   !and water state variables to be constant ( vr 0 ) or 
                   !to vary "normally". (vr 1).  We also turn the water
                   !submodel off to present failure. 
                   !d treevr, soilvr, watervr, s_water
   ! 71. final !Display results at end of rotation or run.
   ! 72. Nle !Display foliage N variables. 
   ! 73. litter_all_met  !Make the litter all metabolic, by setting met
          !fraction = 1 and cel and lig fractions equal to zero.
   ! 74. wateroff  !Turn off water submodel and leaching. 
   ! 75. envdataswitches !Environmental data switches, default filenames 
   ! 76. diurnaldata (s_diurnal_dat = 1, filenamedi = diurnal.dat, &
            !           nyears_rw_di = 5 ) 
   ! 76a. dida2dys (s_diurnal_dat = 1, filenamedi = dida2dys.dat, &
            !           nyears_rw_di = 5 ) yyy unfinished
   ! 77. dailydata (s_daily_dat = 1, filenamedy = daily.dat)
            !Daily environmental data input from default file daily.dat. 
   ! 78. dailydataout ( s_dy_dat_out = 0 ) !Default 0. If set to 1, with eg
        !"dailydataout 1", then daily data output to file dailyout.dat.
   ! 79. months12data (s_months12_dat = 1, filenamem12 = months12.dat)
           !12 months environmental data. Default is months12.dat, a copy of
           !Eskdale.dat, for Eskdalemuir. 
   ! 80. CLINOdata (s_CLINO_dat = 1, filenameCLINO = CLINO.dat)
            !12 months CLINO data. 
   ! 81. goenvs !Run for 1 year with all the environmental data options.
   ! 82. env !Display instantaneous environment  
   ! 83. envda !Display environment, daily averages.
   ! 84. envdb !Display environment, daily averages calculation.
   ! 85. envya !Display environmental yearly averages. 
   ! 86. grenvya (xhi = year) !Graph environmental yearly averages.
   ! 87. goded (tstop = 365) !Run 1 (or more) years to examine daily
            !environmental data. 
   ! 88. gocfenv !Compare environments.
   ! 89. ded  !Display daily environmental data. 
   ! 90. windmax !Display quantities involved in calculation of windmax. 
   ! 91. oenv !Output instantaneous environment.
   ! 92. oded !Output of daily environmental data. 
   ! 93. grenv !Graphs of environment.
   ! 94. grded (xhi = month_r) !Graphs of daily environmental data.
   ! 95. prfded !Print to text (.txt) files daily environmental data. 
   ! 96. prsya !Print to screen yearly averages, sums.
   ! 97. CO2 ( CO2vpmc = 350 )  !To reset CO2 concn (vpm).
   ! 98. light ( jPARdymn = 3.8e6 ) !To reset the daily mean light receipt
   ! 99. Tinc ( T_inc = 0 ) !Increase temperatures by 0 deg C. 
   ! 100.litter0 !Set all inputs, outputs to litter pools 0 but not thinning
   ! 101. init (f = sn.sav) !Initialize with steady state initial values, 
   ! 102. saveics (f = old.sav)  !Saves initial conditions to file. 
   ! 103. ce !Set to a constant environment, water submodel off,
   ! 104. T20 (T = 20) !Set temperatures to a constant 20 C, or "T20 15" 
   ! 105. aphid (x = 1, alaa0 = 10)   
          !Switch aphid submodel on/off, aphid 1  10/aphid 0  0  
   ! 106. aphidics !Display aphid initial conditions. 
   ! 107. aphidchecks !Check C and N balance in aphid submodel.
   ! 108. oaphid !Output aphid 
   ! 109. paphid !Prepare aphid
   ! 110. graphid !4 aphid plots  
   ! 111. raph1yr !Run 1 year, no aphid initialization 
   ! 112. bma !To examine growth of biomass alone. 
   ! 113. climatedata (x = 1, f = climate.dat) !Points to proced cd below. 
   ! 114. cd (x = 1, f = climate.dat) !Switches on/off climate data read from 
          !default file climate.dat
   ! 115. CO2cc (x = 1) !Switches on/off linear increase in CO2 concentration.
   ! 116. deciduous (x = 1) !Deciduous mode or evergreen mode (deciduous 0) 
   ! 117. thin ( s_thin = 1 ) !switches thinning on/off, displays thinning pars
   ! 118. thint0 ( s_thin = 1 ) !Thin at time 0, over the first day.
   ! 119. thinbeech ( s_thin = 1 ) !Display current values of thinning
              !parameters. Then set them for beech. 
   ! 120. thinsitka ( tstop = 21900, s_thin = 1 )  
   ! 121. grthinsitka !Graphs for thinsitka runs.  
   ! 122. prftlth_sit !Print tl data for thinsitka runs.
   ! 123. dprune !Display pruning parameters. 
   ! 124. prune ( s_prune = 0, fpruneyr = 0.0 )
   ! 125. selfthin ( s_selfthin = 1, allovr = 0 )  
   ! 126. goselfthintest (tstop = 730, cint = 365, nciout = 1) 
   ! 127. grnseeds !Graphs of nseeds, inputs and outputs.
   ! 128. thin4 !Thinning, with four thinnings over 5 years. 
   ! 129. rotate (s_rotate = 1) !Switch on/off rotations (TERMINAL block) 
   ! 130. dthin !Display thinning parameters.
   ! 131. sk20  !Set rate constants to zero.  Can be useful for debugging. 
   ! 132. envpars !Environmental parameters, default and actual values.
   ! 133. envvars !Display environmental variables.
   ! 134. Hurley !Set conditions to Southern Britain (Hurley)
   ! 135. Eskdal !Set conditions to Northern Britain (Eskdalemuir). 
   ! 136. svs !Display state variables. 
   ! 137. Dsvs  !Display derivatives of the state variables.
   ! 138. Dmorphsvs !Display derivatives of morph (tree) state variables,  
   ! 139. Dtreesvs !Display derivatives of tree state variables. 
   ! 140. Dsoilandlittersvs  !Display derivatives of soil and litter svs
   ! 141. Dwatersvs  !Display derivatives of water submodel state variables 
   ! 142. Dproductsvs !Display derivatives of product submodel state variables
   ! 143. svs0 !Display state variable initial values
   ! 144. le !Foliage property variables  
   ! 145. lef !Leaf (foliage) fluxes
   ! 146. !Display components of Pmax 
   ! 147. alpha !Display components of alpha, photosynthetic efficiency
   ! 148. Pmax20c !Set photosynthetic N to 0. Use the constant value
                !of Pmax20 in Pmax20c
   ! 149. Pmax20vr !Set photosynthetic N variable 
   ! 150. phenol !Phenological state
   ! 151. odid_didin  !Output of diurnal varying data 
   ! 152. godiurnaldata  !Examine diurnal data
   ! 153. odid !Output of diurnal varying data 
   ! 154. grdid !Graphs of diurnal data
   ! 155. prfdid (f = did.txt, nciprn = 1) !Print to file diurnal data 
   ! 156. godi2yrs ( tstop = 730 ) !Test diurnal data. Without rewind 
   ! 157. godi5yrs ( tstop = 1825 ) !Test diurnal data. Without rewind
   ! 158. godi2yrsrw ( tstop = 1460, nyears_rw_di = 2 ) 
          !Test diurnal data with ReWind after 2 yrs
   ! 159. grdi !Graphs of diurnal environment quantities
   ! 160. gody10dys ( tstop = 365 ) !Test daily data over 10 days from zh FACE
   ! 161. gody1yr ( tstop = 365 ) !Test daily data ??
   ! 162. preparsvs !Prepare state variables
   ! 163. preparDsvs !Prepare derivatives of the state variables
   ! 164. r12h !Run for 12 h from t = 0 d
   ! 165. r1dy !Run for one day from t = 0 d
   ! 166. odi !Output some diurnal quantities
   ! 167. r2dys !Run for two days with cint = 0.5, nciout = 1
   ! 168. r5dys !Run for five days, cint = 1
   ! 169. r10dys !Run for 10 days, cint = 1, nciout = 2  
   ! 170. r20dys !Run for 20 days 
   ! 171. r60dys !Run for 60 days 
   ! 172. r100dys !Run for 100 days 
   ! 173. r1yr (cint = 0.125, nciout = 584) !Run for 1 year, 584 = 8 * 73
   ! 174. r2yrs !Run for 2 years
   ! 175. r3yrs !Run for 3 years 
   ! 176. r4yrs !Run for 4 years
   ! 177. r5yrs !Run for 5 years 
   ! 178. r8yrs !Run for 8 years 
   ! 179. r10yrs !Run for 10 years
   ! 179a. r15yrs !Run for 15 years
   ! 180. r20yrs !Run for 20 years
   ! 181. r21yrs !Run for 21 years 
   ! 182. r50yrs !Run for 50 years
   ! 183. r60yrs !Run for 60 years 
   ! 184. r100yrs !Run for 100 years
   ! 185. r200yrs !Run for 200 years 
   ! 186. r500yrs !Run for 500 years
   ! 187. r1000yrs !Run for 1000 years
   ! 188. gr1d (xlo = 0, xhi = 1) !Time t in days is abscissa, x
   ! 189. settitle !Set title from 41 onwards to blanks 
   ! 190. gryrs !Plot graphs with year as the abscissa
   ! 191. grya (xhi = 60) !General-purpose yearly-average graphs for a 
                          !60-year rotation, or do grya 90 for beech 
   ! 192. grW (xhi = 60) !Items relevant to water 
   ! 193. grCsol !plots of items relevant to soluble C in soil 
   ! 194. oW !Output water variables
   ! 195. oSLA !Output SLA variables
   ! 196. twiddle !Parameter twiddling. ugh
   ! 197. Nfix !Nfixation parameters and variables 
   ! 198. otest !output list, of unknown origin
   ! 199. othin !Output for thinning (evergreen)
   ! 200. othinb !Output for thinning (deciduous)
   ! 201. surf_li !Surface litter, examine fluxes at t = 0 
   ! 202. OCSfi !display outputs of C substrate fine roots pool
   ! 203. cf3env !Compare 3 environments over 12 months 
   ! 204. s_diurnal ( s_diurnal = 1 ) !Examine results, diurnal switch on/off
   ! 205. grs_diurnal !Graphs from s_diurnal
   ! 206. s_diprf (f = s_diurnal.txt) !Print to file
   ! 207. gomnn (filenamemnn ="monthsnn.dat") !Not tested
   ! 208. goCO2cc ( tstop = 3650 ) !Examine C02 under climate change
   ! 209. gowindcc ( tstop = 3650 ) !Examine wind increase under climate change
   ! 210. monthsnndata (s_monthsnn_dat = 1, filenamemnn = monthsnn.dat) 
   ! 211. End of proceds, search for ! 211.

! 1. 
proced acslpars ( tstop = 0, cint = 1, nciout = 73 ) 
      !Display and possibly reset some acsl parameters.
      d ialg, cint, maxt
      d nciout, nciprn, nsteps
      d tstop, nstart
      s tstop = &tstop, cint = &cint, nciout = &nciout 
end !acslpars.

! 2. 
proced ps !Postscript graphs.
   s devplt = 5, plt = 15
end !ps.

! 3. 
proced plc !Plot close (closes the postscript file so you can print it).
   plot/close
end !plc.

! 4. 
proced notps  !Not postscript graphs, screen graphs.
   s devplt = 1, plt = 6
end !notps.

! 5. 
proced notext !No text on graphs.
   s satcpl = .t., dpnplt = .f.
end !notext.

! 6. 
proced oc 
   !Clear and possibly reset the screen output list.
   output/clear
   !output t, LAI, dWle
end !oc.

! 7.
proced pc !Clear and possibly reset the prepar list. 
   !(for printing and plotting).
   prepare/clear
   !prepar t, LAI, dWle
end !pc.

! 8. 
proced notext !No text on plots.
   s satcpl = .t., dpnplt = .f.
   !Suppress axis text.  Do not print date.
end !notext.

! 9. 
proced rw   !Rewind the .rrr file.
   s nrwitg = .f. !NRWitg is .f.,there is a rewind of the rrr data logged 
      !of variables in the prepar list. This is the default of .nrwitg.
      !You can d(isplay) .nrwitg.
end !rw. 

! 10.
proced nrw (nrwitg = .t.) !No rewind, see above. 
   s nrwitg = &nrwitg
end !nrw.

! 11. 
proced ncf ( f = efm.cmd ) !New command file.
   !restore !values saved at the end of efm.cmd. See page 5-50 of acsl 
            !reference manual which states that a file name MUST be specified
            !if restore is used - even if this is the default file acslsv. 
            !SAVE gives acslsv by default.  
            !Sometimes it is best to quit acsl and re-run acsl. 
            !and then do an "ncf aphid.cmd" from the keyboard.
   file/cmdfile = '&f'
end !ncf.

! 12. 
proced go (tstop = 365, cint = 365, nciout = 1) !Do a simulation.
                        !365 days is default - else eg <go 50 10>.
   s cint = &cint, nciout = &nciout, tstop = &tstop
   start
end !go.

! 13. 
proced gob (tstop = 1095, cint = 1, nciout = 73) !Do a simulation for beech
                        !3 yrs is default - else eg "gob tstop, cint".
   beech !See/set the parameters for beech
   output s_deciduous, LAIya, tstop, morph, &
          dorm2, comp, budb, dorm1, itdorm1plus, tdorm1,  halfmaxt, &
          year, itau_dorm2, latit_deg, nstart
   s cint = &cint, nciout = &nciout, tstop = &tstop
   start
   !grb? or grb1 6 12
end !gob.

! 14.
proced grmonthsbb (xlo = 0, xhi = month_r) !Graphs against running months,
   !bounded upper and lower.
   d xincpl, xticpl 
   s xincpl= 6, xticpl = 1.0
   plot/xaxis = month_r/xhi=&xhi, dorm2, comp
   plot/xaxis = month_r/xhi=&xhi, budb, dorm1/same, LAI
   plot/xaxis = month_r/xhi=&xhi, itdorm1plus/lo=0/hi=2000, tdorm1, &
                                  itau_dorm2/same
   plot dorm2, comp
   plot budb,dorm2/same, LAI
   plot itdorm1plus/lo=0/hi=2000, tdorm1/same, itau_dorm2
   plot bb_notthisyr/lo=0/hi=2
end !grmonthsbb.

! 15.
proced grmonthsbb1 (xlo = 0, xhi = month_r) !1 Plot
   d xincpl, xticpl 
   s xincpl= 6, xticpl = 1.0
   plot/xaxis = month_r/xlo= &xlo/xhi=&xhi, dorm1, dormant
end !grmonthsbb1.

! 16.
proced co (tstop = 730) !Continue the simulation with a no rewind.
                        !730 day is default - else eg <co 100>.
   nrw
   d tstop
   s tstop = &tstop
   cont
end !co.

! 17.
proced datetime !Display date and time.
   d t, year
   d imonth, idaymo, hour
   d tdec, daylengthhr, light_on
end !datetime.

! 18.
proced test (tstop = 10, cint = 1, nciout = 10) !Do a test simulation.
   s tstop = &tstop, cint = &cint, nciout = &nciout
   oc; output t, Tair, jPARdy,  LAI, Nmin, Wle,  Cle, NuSOM, psifi, &
              DCsys, DNsys, DWsys
   start; 

!Results should be:
!           T 0.                 TAIR 1.84318104       JPARDY 561688.993
!         LAI 0.00300000         NMIN 1.0000D-03          WLE 0.02400000
!         CLE 0.02000000        NUSOM 0.04000000        PSIFI 7.21462512
!       DCSYS-2.9950D-04        DNSYS-2.4626D-06        DWSYS-3.0395D-04 
!
!           T 10.0000000         TAIR 1.49850088       JPARDY 718337.706
!         LAI 0.00300557         NMIN 0.00101542          WLE 0.02400978
!         CLE 0.01625030        NUSOM 0.03999484        PSIFI-26.2608222
!       DCSYS-7.7297D-05        DNSYS-2.2357D-06        DWSYS 2.5651D-04
end !test.

! 19.
proced testaphid (tstop = 10, cint = 1, nciout = 10) !Test simulation, aphids.
   !Note: this will be for Eskdalemuir sinusoidal climate. 
   s tstop = &tstop, cint = &cint, nciout = &nciout
   aphid 1, 10 !Switches aphid submodel on and puts 10 aphids into 
               !alate adult compartment.
   oc; 
   output t, Tair, jPARdy,  LAI, alaa, aph, &
       roaph, Nle, Nphloem, apt1, apti, Oalaa_emi, &
       Oaph_sn, s_selfthin, allovr
   start
   d aph, daph, daph_chk, Oaph_sn

!Results should be:
!          T 0.                 TAIR 1.84318104       JPARDY 561688.993
!         LAI 0.00300000         ALAA 10.0000000          APH 10.0000000
!       ROAPH 1111.11110          NLE 0.01000000      NPHLOEM 9.99999927
!        APT1 0.                 APTI 0.            OALAA_EMI 0.08100407
!     OAPH_SN 0.           S_SELFTHIN 0.               ALLOVR 1.00000000
! 
!           T 10.0000000         TAIR 1.49850088       JPARDY 718337.706
!         LAI 0.00300557         ALAA 6.75407479          APH 7.17803824
!       ROAPH 797.558914          NLE 0.01010889      NPHLOEM 10.1088853
!        APT1 0.39881407         APTI 0.41982105    OALAA_EMI 0.02565073
!     OAPH_SN 0.           S_SELFTHIN 0.               ALLOVR 1.00000000
 
!   d aph, daph, daph_chk, Oaph_sn
!         APH 7.17803824         DAPH-0.22335072     DAPH_CHK-0.22335072
!     OAPH_SN 0.

   !aphid 0 0 !Switches aphids off. Do you want this?  Or checks!
end !testaphid.

! 20.

proced fec ( m_alaa_fec = 1, m_apta_fec = 1 )
   !Set aphid fecundity multipliers. eg. fec 2 2
   s m_alaa_fec = &m_alaa_fec, m_apta_fec = &m_apta_fec
   !Call fec resets the fecundity multipliers to 1,1.
end !fec.

! 21.
proced testb (tstop = 730, nciout = 365) !Do a test simulation for beech
   beech !Display current parameters and set parameters to beech values
   s cint = 1
   s tstop = &tstop, nciout = &nciout
   oc; output t, Tair, jPARdy, LAI_1Aug15h, Nmin, Wfi
   start
!Output was:
!           T 0.                 TAIR 1.84318104       JPARDY 561688.993
! LAI_1AUG15H 5.5555D+33         NMIN 1.0000D-03          WFI 0.02400000
!           T 365.000000         TAIR 1.84318104       JPARDY 561688.993
! LAI_1AUG15H 0.01086772         NMIN 0.00213044          WFI 0.03713796
!           T 730.000000         TAIR 1.84318104       JPARDY 561688.993
! LAI_1AUG15H 0.07069025         NMIN 0.00184935          WFI 0.07234202
end !testb.

! 22.
proced test60 (tstop = 21900, cint = 365, nciout = 1) !21900 = 60 * 365.
   !Do a test simulation, Sitka, 60-year rotations, with standard thinning.
   !thin switches on thinning, with yrthin at 20, 25, 30, 35, 40, 45, 50, 55 
   s tstop = 365, cint = 365, nciout = 1; start !To initialize.
   s tstop = &tstop, cint = &cint, nciout = &nciout
   othin; thin
   start
   plot/xaxis = year/ xhi = 60, nstems
end !test60.

! 23.
proced testb90 (tstop = 32850, cint = 365, nciout = 10) 
   !Do a test simulation, beech, 90-year rotation, with thinning.
   s tstop = &tstop, cint = &cint, nciout = &nciout
   beech
   othinb; thinbeech
   start
end !testb90.

! 24.
proced dswitches  !Display switches.
   !See also proced envpars ! 132 !Environmental data parameters and switches.
   d s_aphid    !Aphid model on (1) or off (0). See proced aphid.
   d s_bio_alone !For looking specifically at growth of soil biomass.
                 !See efm.csl. See proced bma (biomass alone).
   d s_cd   !Climate data.  Annual (or less frequent) changes in climate 
            !(temperature, CO2, N deposition) are read in if s_cd = 1 from
            !file climate.dat.  See efm.csl, climate.dat and proced cd.
   d s_CO2cc !Linear increase in CO2 concentration if s_CO2cc = 1.
             !See efm.csl and proced CO2cc.
   pause
   d s_daily_dat  !Input daily data from file daily.dat (if = 1).
                  !See proced dailydata and efm.csl.
   d s_deciduous  !Deciduous (1) or evergreen (0).
                  !See efm.csl and proced deciduous
   d s_diurnal    !Diurnally varying environmental data is calculated 
                  !from daily values (however these are obtained - eg from
                  !internal sinusoids (default), from monthly data
                  !(s_months12.dat or s_monthsnn.dat) or from daily data 
                  !(s_daily_data), from diurnal data input (s_diurnal_dat).
                  !Default is s_diurnal = 1.
                  !Diurnal data is radiation (jPARsc), air temperature (Tair), 
                  !relative humidity (RH), wind (wind).
                  !or is constant throughout the day: soil temperature (Tsoil),
                  !rain (rain).
                  !See proced ce (constant environment).
   d s_diurnal_dat !Input diurnal data from file diurnal.dat (if = 1).
                  !See proced diurnaldata and efm.csl.
   d s_di_dat_out !Diurnal data are output to file di_out.dat (if = 1).

   pause
   d s_fert       !Switches fertilizer application on. See sfert0 and sfert1
   d s_fire       !Switches on wild fires and prescribed fires (if = 1). 
                  !See file fire.cmd and efm.csl.
   d s_gstom      !Options for stomatal conductance.  See efm.csl.
   d s_gstom_Pmax !Options for effect of stomatal closure on Pmax of
                  !leaf photosynthesis:light response. See efm.csl.
   d s_kXfi_li    !If = 0, switches off fine root turnover if no leaves.
   d s_leach      !If = 0, switches off NO3 leaching.
   d s_leaf       !If = 1, leaves are present. If = 0, no leaves.
                  !s_leafya, s_leafyb are the yearly integrals of s_leaf.
                  !s_leafya gives the days/year that leaves are present.
   d s_light_KXle_li !If = 1, light level affects leaf turnover rate.
   d s_months12_dat    !Input monthly data from file monthly.dat (if = 1).
                  !See proced months12_dat and efm.csl.
   d s_monthsnn_dat !Input monthly data from file grampian.dat (if = 1).
                  !See cmd file (below) and efm.csl.
   pause
   d s_Namm_le_atm !If = 0, flux from leaf Namm substrate pool to 
                  !atmosphere is switched off.
   d s_PAR_sin    !Use a full sine wave for daily PAR radiation (if = 1).
                  !Alternatives: constant, or step function. See efm.csl.
   d s_Pcan       !=4: non-rectangular hyperbola, acclimation, sun/shade.
                  !For alternatives see efm.csl.
   d s_Pmax       !=1: Pmax ~ photosynthetic N per leaf area. Default.
                  !=0: Pmax = constant.  See proced Pmax.
   pause
   d s_prune      !set to 1, switches pruning on.   Default = 0.
                  !See proced prune.
   d s_rotate     !set to 1, switches rotation on.  Default = 0.
                  !See proced rotate.
   d s_seasonal   != 1 by default, seasonal environment occurs. Else 0.
   d s_selfthin   != 0 by default, no self-thinning, plantation mode. Else 1.
                  !See proced selfthin.
   d s_SLA        != 1 by default, SLA affected by C substrate.
                  != 0, SLA affected by C substrate as per Michaelis-Menten.
                  !else, SLA affected by CN substrate ratio.  See efm.csl.
   d s_Tcc        != 0 default. Annual temperatures constant.
                  != 1, temperatures increase linearly (climate change).
   d s_thin       != 0 (default), no management thinning. Else 1.
                  !See proced thin.
   d s_water      != 1 (default), water submodel turned on.
                  !if = 0, set also watervr = 0 to stop water state
                  !variables going mad.
end !dswitches.   !Display switches 

! 25.   
proced testthin !Test thinning sections for C, N, W conservation.
   !Output procedure:
      output/clear
      output t, yearbeg, kpulse_thin, &
         nstems, dnstems, Onstems_th, &
         DCsys, DNsys, DWsys,&
         DCsys_chk, DNsys_chk, DWsys_chk, &
         DCtree, DNtree, DWtree, &
         DCtree_chk, DNtree_chk, DWtree_chk, &
         DCsoil, DNsoil, DWsoil, &
         DCsoil_chk, DNsoil_chk, DWsoil_chk, &
         DCptrd, DNptrd, DWptrd, &
         DCptrd_chk, DNptrd_chk, DWptrd_chk, &
         DCAph, DNAph, Cptrd, &
         DCAph_chk, DNAph_chk, Nptrd, &
         OCtree_th, OCth_pr, ICth_litter, &
         ONtree_th, ONth_pr, INth_litter  !, &
!         Int_OCtree_th, Int_OCth_pr, Int_ICth_litter, &
!         Int_ICth_litter_and_pr, &
!         Int_ONtree_th, Int_ONth_pr, Int_INth_litter, &
!         Int_INth_litter_and_pr, &
!         kpulse_thinda, kpulse_thinya

   !Switch on thinning:
      s s_thin = 1 
   !Set number of thinnings:
      s nthin = 1
   !Set thinning time to 365 days:
      s tthin(1) = 365 !days.
   !Set run control parameters (run stops when thinning begins):
      s cint = 1, nciout = 73, tstop = 365
   !Set thinning fraction:
      s fst_rem_th( 1 ) = 0.5 
   !Increase initial size of tree seedlings to increase the magnitude of
      !the thinning fluxes:
      s sctreeic = 100
   r1yr !Run for one year.
   s cint = 0.25, nciout = 1, tstop = 365.5  !i.e. to midday, on the day
   cont                                      !when thinning is occurring.
   
   !Next type "s tstop = 366", followed by "cont", so that thinning is
   !now complete.
end !testthin.

! 26.
proced testthin1start !Run with a single start for testing.
   !Test thinning sections for C, N, W conservation.
   !Output procedure:
      output/clear
      output t, yearbeg, kpulse_thin, &
         nstems, dnstems, Onstems_th, &
         DCsys, DNsys, DWsys,&
         DCsys_chk, DNsys_chk, DWsys_chk, &
         DCtree, DNtree, DWtree, &
         DCtree_chk, DNtree_chk, DWtree_chk, &
         DCsoil, DNsoil, DWsoil, &
         DCsoil_chk, DNsoil_chk, DWsoil_chk, &
         DCptrd, DNptrd, DWptrd, &
         DCptrd_chk, DNptrd_chk, DWptrd_chk, &
         DCAph, DNAph, Cptrd, &
         DCAph_chk, DNAph_chk, Nptrd, &
         OCtree_th, OCth_pr, ICth_litter, &
         ONtree_th, ONth_pr, INth_litter  !, &
!         Int_OCtree_th, Int_OCth_pr, Int_ICth_litter, &
!         Int_ICth_litter_and_pr, &
!         Int_ONtree_th, Int_ONth_pr, Int_INth_litter, &
!         Int_INth_litter_and_pr, &
!         kpulse_thinda, kpulse_thinya

   !Switch on thinning:
      s s_thin = 1 
   !Set number of thinnings:
      s nthin = 1
   !Set thinning time to 0 days:
      s tthin(1) = 0 !days.
   !Set run control parameters (run stops when thinning begins):
      s cint = 0.5, nciout = 1, tstop = 0.5
   !Set thinning fraction:
      s fst_rem_th( 1 ) = 0.5 
   !Increase initial size of tree seedlings to increase the magnitude of
      !the thinning fluxes:
      s sctreeic = 100
      start
      checks !Seems all ok. 
end !testthin1start.

! 27.
proced testrotate ( cint = 365, tstop = 365 )
   !Test C, N balances when completing rotations.
   oc !Output clear.
   output nstart, irotate, year, &
          Clitter, Ctree, CSOM, &
          Nlitter, Ntree, NSOM, &
          Nmin, Csys, Nsys
   s cint = &cint, tstop = &tstop
   d cint, tstop
   s s_rotate = 1
   start; start
!end of testrorate, Check that Csys and Nsys at the end of rotation 1
!are the same as at the beginning of rotation 2.
end !testrotate.

! 28.
proced testprune ( tstop = 365 )
   !Test pruning sections for C, N, W conservation.
   !Output procedure:
      output/clear
      output t, yearbeg, fpruneyr, &
         nstems, dnstems, kprune, &
         DCsys, DNsys, DWsys,&
         DCsys_chk, DNsys_chk, DWsys_chk, &
         DCtree, DNtree, DWtree, &
         DCtree_chk, DNtree_chk, DWtree_chk, &
         DCsoil, DNsoil, DWsoil, &
         DCsoil_chk, DNsoil_chk, DWsoil_chk, &
         DCptrd, DNptrd, DWptrd, &
         DCptrd_chk, DNptrd_chk, DWptrd_chk, &
         DCAph, DNAph, Cptrd, &
         DCAph_chk, DNAph_chk, Nptrd
   !Switch on pruning:
      s s_prune = 1 
   !Set pruning fraction:
      s fpruneyr = 0.5 
             !Fraction pruned per year. Applies to le, br, st. Not co, fi.
   !Increase initial size of tree seedlings to increase the magnitude of
      !the pruning fluxes:
      s sctreeic = 100
   !Set run control parameters:
      s cint = 1, nciout = 73, tstop = &tstop
   start
   d k??_prune
   d year, fpruneyr, fpruneyr_chk
end !testprune. 

! 29.
proced temppars !Display temperature parameters. 
   d m_fT !Dimensionless multiplier of temperature function
   d T0, T0p !T0 and T0p are the temperatures when standard f(T) = 0
   d qfT1, qfT2 !( T - T0 ) ** qfT1 * ( T0p - T ) ** qfT2
   d Tref !T when standard f(T) = 1
end !temppars.

! 30.
proced fire (s_fire = 1) 
   !turns on/off default [severe (high intensity)] fire.
   !For fire parameters, type "firepars".
   d s_fire
   s s_fire = &s_fire
end !fire.

! 31.
proced firepars !Fire parameters displayed. 
   d s_fire, nfire, nfiremax
   d tfire
   d fst_kill_fire
   d ftreeN_fire_Namm, fbrstXC_fire_atm
   d fsurf_li_fire
   d fsurf_liC_fire_atm, fsurf_liN_fire_Namm
   d tauyr_fire_soilT_inc, Tsoil_inc_fire_max , m_kmin_fire_max_1 
end !firepars.

! 32.
proced testfire (tstop = 7300)  !Fire at t = 365 to 366. eg tstop = 365.5
               !stops in the middle of the fire.
   !Halfway through the fire beginning next year 1 Jan, 0 h.
   oc; 
   output t, pulse_fire, kst_firez, &
          LAI, nstems, Onstems_fire, &
          tstop, Tsoil_inc_fire, m_kmin_fire, &
          s_fire, tauyr_fire_soilT_inc, Tsoil_inc_fire_max, &
          fst_kill_fire(1), fsurf_li_fire(1), yr_fireEfNd, &
          ocfi_fire_gnd, ocfi_fire_gnd_chk, &
          onfi_fire_gnd, onfi_fire_gnd_chk, &         
          runno
   prepar s_fire
   !Eskdalemuir sinusoidal environment. Default.
   rw !Rewind.
   selfthin !Turn on self-thinning.
   !Initialize with selfthinning (sn) steady-state for Eskdale sinusoidal
               !environment.
      restore/f = 'sn.sav' !Equilibrium state for Sitka, selfthinning. 
      s calcics = .f.  !Do not recalculate initial values in initial section.
      s tic = 0        !Reset time to zero.
   !Run for one year to initialize all *ya and *da quantities.
      s tstop = 365, cint = 1, nciout = 73; start
      rw !Rewind.

   fire !Switch on fire at 1 year. See proced fire above.
   d tfire(1)  !Fire occurs 0 h, 1st Jan of year 2, and lasts 1 day.
   s fst_kill_fire(1) = 0.8, fsurf_li_fire(1) = 0.5
   s cint = 1, nciout = 73, tstop = &tstop

   s runno = 1
   start
!   nrw
!   s runno = 2
!   s tauyr_fire_soilT_inc = 10 !10 years. NOTE Tau.. in years
!   start
   !d O???_fire_gnd
   !d O???_fire_gnd_chk
   plot/xaxis = year pulse_fire/hi = 2 
   plot lai
   !Nmin = Namm +  Nnit    !kg N m-2.
   !Nmine3 = c1000 * Nmin !g N m-2.
   plot m_kmin_fire !Now ok.  Goes down to 1 in the second run.
!   plot/run = 1, Nmin, m_kmin_fire/lo=-1/hi=4, runno
!   plot/run = 2, Nmin, m_kmin_fire/lo=-1/hi=4, runno
   plot Tsoil_inc_fire/hi = 5 !Both runs.
   plot Nmin !Both runs.
!   plot INtree_fire_Nammda    
!   plot INsurf_li_fire_Nammda 
   plot Ntree, Nsurf_li
!   print/run=1/f='old.txt' year, lai, runno/nciprn = 365
end !testfire.

! 33.
proced grtestfire (xlo = 364, xhi = 366)
   s xincpl = 6, xticpl = 1.5
   plot /xaxis = t/xlo=&xlo/xhi=&xhi, pulse_fire/hi=2, &
      gstom
end !grtestfire.

! 34.
proced beech !Use to display sitka parameter values and reset for beech

  !Beech values.                                                  Default
                                                                  !Sitka
   d s_deciduous; s s_deciduous = 1     !Deciduous tree mode.         0
   d s_light_KXle_li; s s_light_KXle_li = 0 !                         1
          !No increase in leaf senescence due to shading.
          !We have not changed leaf senescence rate, 
          !kXle_li20. This is  = 0.002 d-1, giving a
          !half-life of foliage at 10 deg C (fTsh = 0.35) of 
          != 0.69/ (0.35 * k) = 1000 day.  4 compartments.
          !already quite small for conifers.
   d kXbr_li20 , kXco_li20 , kXfi_li20 
   s kXbr_li20 = 0.0001  !Increase branch lifetime.                   0.001
   s kXco_li20 = 0.0002  !Increase coarse roots lifetime.             0.001
   s kXfi_li20 = 0.001   !Increase fine root lifetime.                0.01
   d fCXle_rec_max, fCXfi_rec_max 
   s fCXle_rec_max = 0.8, fCXfi_rec_max = 0.8   !Both                 0.5
                         !Increase fractions of recycled C and N from
                         !foliage and fine root litter fluxes.
   d s_kXfi_li 
   s s_kXfi_li = 0       !Switch off fine root litter flux when leaves
                         !are not present. This stops the fine roots
                         !running down during the dormant period and
                         !before budburst.                            1
   d cSLA_C 
   s cSLA_C = 5          !Larger response of Specific Leaf
                         !Area to foliage C substrate concn Cle      2.5
                         !when s_SLA = 1.
   d SLAmax 
   s SLAmax = 30.0       !Maximum value of SLA                       10
   d kG_Nph20 
   s kG_Nph20 = 0.015    !Synthesis of photosynthetic protein.        0.03
   d cPmax_Nph 
   s cPmax_Nph = 0.002   !kg CO2 s-1 (kg photosynthetic N)-1.         0.0008
                         !2.5 times as big, to compensate for the
                         !larger SLAmax and the higher photosynthetic
                         !efficiency of beech (relative to conifers).
   d kcan 
   s kcan = 0.87         !Canopy extinction coefficient.              0.5
   d chileaf 
   s chileaf = 0.1       !Leaf transmittivity.                        0.03
   s cCO2_gs = 0.3       !Effect of CO2 doubling (350 to 700) on
                         !acclimation of gstom, stomatal conductance. 0.15
                         !0.3 gives 30% decrease on CO2 doubling.
   d KCmai 
   s KCmai = 0.1         !Decrease maintenance respiration. This
                         !increases sugar levels and, through osmotic
                         !pressure, will cause stomates to be open
                         !for longer.                                 0.05
   d kuN20 
   s kuN20 = 5           !Increase root uptake efficiency.            0.1
   d rostem 
   s rostem = 500        !Stem density. kg stem structural DM m-3.    350
                         !Decrease growth rate constants for branch,
                         !stem, coarse root, fine root meristems. 
     
   d kGbrm20, kGcom20, kGfim20, kGstm20   !all 200 ([CS] [NS] d-1
   s kGbrm20 = 100, kGcom20 = 50, kGfim20 = 10, kGstm20 = 100    !all 200
   d kGlebud20 , kGbrbud20 
   s kGlebud20 = 500, kGbrbud20 = 500  
                         !Increase bud growth. This means there will
                         !be more overwintering buds, and LAI will
                         !get a better start after budburst.          200, 200
   d kfisurf_fi, kso_fisurf 
   s kfisurf_fi = 0.5, kso_fisurf = 20000
          !Water soil/root rate constants.            5, 100000
   d roWle20 , roWst20 , roWfi20 
   s roWle20 = 1, roWst20 = 1, roWfi20 = 1 !Decrease water transport
                         !resistivities.                               10

   d maxt, one128th
   s maxt = one512th                                               
end !beech.

! 35.
proced deciduous !Deciduous mode. No change in parameter values.
   s s_deciduous = 1     !Deciduous tree mode.
   s maxt = one512th     !50 s per simulated year.
end !deciduous.

! 36.
proced quasibeech !For running Sitka, but using many beech parameters,
   !where this seems ok.  Otherwise comment out the changes. Procedure
   !is derived from proced beech above.
  !Beech values.                                                  Default
                                                                  !Sitka
!   s s_deciduous = 1     !Deciduous tree mode.                        0
!   s s_light_KXle_li = 0 !No increase in leaf senescence due to
                          !shading.                                    1
       !We have not changed leaf senescence rate, 
       !kXle_li20. This is already quite small for conifers.
   s kXbr_li20 = 0.0001  !Increase branch lifetime.                   0.001
   s kXco_li20 = 0.0002  !Increase coarse roots lifetime.             0.001
   s kXfi_li20 = 0.001   !Increase fine root lifetime.                0.01
   s fCXle_rec_max = 0.8, fCXfi_rec_max = 0.8                         0.5
                         !Increase fractions of recycled C and N from
                         !foliage and fine root litter fluxes.
!   s s_kXfi_li = 0       !Switch off fine root litter flux when leaves
                         !are not present. This stops the fine roots
                         !running down during the dormant period and
                         !before budburst.                            1
!   s cSLA_C = 10         !Larger response of Specific Leaf Area
                         !to carbohydrate concn.                      2.5
!   s SLAmax = 30.0       !Maximum value of SLA                       10
!   s kG_Nph20 = 0.015    !Synthesis of photosynthetic protein.        0.03
!   s cPmax_Nph = 0.002   !kg CO2 s-1 (kg photosynthetic N)-1.         0.0008
                         !2 times as big, to compensate for the
                         !larger SLAmax and the higher photosynthetic
                         !efficiency of beech (relative to conifers).
!   s kcan = 0.87         !Canopy extinction coefficient.              0.5.
!   s chileaf = 0.1       !Leaf transmittivity.                        0.03.
   s KCmai = 0.1         !Decrease maintenance respiration. This
                         !increases sugar levels and, through osmotic
                         !pressure, will cause stomates to be open
                         !for longer.                                 0.05
   s roC20 = 0.1         !Within-plant C substrate transport
                            !resistivity. Default:                    0.01.
   s kuN20 = 5           !Increase root uptake efficiency.            0.1
!   s rostem = 500        !Stem density. kg stem structural DM m-3.    350
                         !Decrease growth rate constants for branch,
                         !stem, coarse root, fine root meristems. 
                                                 !All default:        200
   s kGbrm20 = 100       !([CS] [NS] day)-1.                          200
   s kGcom20 = 50, kGfim20 = 10, kGstm20 = 100 !                      200
   s kGbud20 = 500       !Increase bud growth. This means there will
                         !be more overwintering buds, and LAI will
                         !get a better start after budburst.          200
   s kso_fisurf = 20000, kfisurf_fi = 0.5
                         !Water soil/root rate constants.          100000, 5
   s roWle20 = 1, roWst20 = 1, roWfi20 = 1 !Decrease water transport
                         !resistivities.                               10
   s maxt = one512th                                               !one128th.
end !quasibeech.

! 37.
proced dbeech !Display beech parameter values. No change in values
      d s_deciduous
      d s_light_KXle_li
      d kXbr_li20, kXco_li20, kXfi_li20
      d fCXle_rec_max, fCXfi_rec_max
      d s_kXfi_li
      d cSLA_C
      d SLAmax
      d kG_Nph20
      d cPmax_Nph
      d kcan
      d chileaf
      d KCmai
      d roC20, roN20
      d kuN20
      d rostem
      d kGbrm20
      d kGcom20, kGfim20, kGstm20
      d kGlebud20, kGbrbud20 
      d kso_fisurf, kfisurf_fi
      d roWle20, roWst20, roWfi20
      d maxt
end !dbeech.

! 38.
proced sitka !Display current parameters and reset to Sitka default values.
   d s_deciduous ;     s s_deciduous = 0
   d s_light_KXle_li ; s s_light_KXle_li = 1 
   d kXbr_li20 ;       s kXbr_li20 = 0.001
   d kXco_li20 ;       s kXco_li20 = 0.001
   d kXfi_li20 ;       s kXfi_li20 = 0.01
   d fCXle_rec_max ;   s fCXle_rec_max = 0.5
   d fCXfi_rec_max ;   s fCXfi_rec_max = 0.5; 
pause
   d s_kXfi_li     ;   s s_kXfi_li = 1
   d cSLA_C      ;     s cSLA_C = 2.5
   d SLAmax      ;     s SLAmax = 10 
   d kG_Nph20      ;   s kG_Nph20 = 0.03
   d cPmax_Nph     ;   s cPmax_Nph = 0.0008 
   d kcan      ;       s kcan = 0.5
pause
   d chileaf       ;   s chileaf = 0.03
   d cCO2_gs       ;   s cCO2_gs = 0.15
   d KCmai       ;     s KCmai = 0.05
!   s roC20       ;!   s roC20 = 0.01
!   s roN20    ;   !   s roN20 = 5
   d kuN20         ;   s kuN20 = 0.1      
pause
   d rostem        ;   s rostem = 350  
   d kGbrm20, kGstm20; s kGbrm20 = 200, kGstm20 = 200
   d kGcom20, kGfim20; s kGcom20 = 200, kGfim20 = 200
   d kGlebud20, kGbrbud20;      s kGlebud20 = 200, kGbrbud20 = 200
   d kso_fisurf, kfisurf_fi;    s kso_fisurf = 100000, kfisurf_fi = 5
   d roWle20, roWst20, roWfi20; s roWle20 = 10, roWst20 = 10, roWfi20 = 10
   d maxt;             s maxt = one128th
end !Sitka.

! 39.
proced dfert !Display fertilizer parameters.
   d s_fert
   d tfert?
   d INfert?_Namm, INfert?_Nnit
end !dfert.

! 40.
proced sfert1 ( tfert1 = 5595 ) !Set 1 fertilizer application.
   d s_fert; s s_fert = 1
      ! tfert1 = 5595 d is the 1 May of 16th year, when the forest canopy
      ! is closed and seasonal uptake is high. uN_gndda, uN_stemda.
      ! Run for 20 years without thinning. 
   s tfert1 = &tfert1, INfert1_Namm = 0.05, INfert1_Nnit = 0.0, tstop = 7300 
      d tfert?, INfert?_Namm, INfert?_Nnit, tstop 
end !sfert1.

! 41.
proced sfert0 !Switch off fertilizer application.
   d s_fert; s s_fert = 0
   d s_fert
end !sfert0.

! 42.
proced gofert !Fertilizer 
   oc
   output t, year, tstop, INfert_Nammda, INfert_Nnitda, runno
   pc
   prepar t, year, LAI, nstems, Nmin, Namm, Nnit, *da, *ya, runno
   thin
   s runno = 0
   rw; s tstop = 365; start !Initialization run.
   s runno = 1
   sfert0; r20yrs; nrw !Run 1. No fertilizer.
   s runno = 2
   sfert1; r60yrs      !Run 2. Fertilizer: 500 kg N ha-1 at 5595 days.
       !5595 = 15 yrs 5475 d + 120 d = 5595 d, 1st May in 16th year
   plot/xaxis = year/run=2, Namm, Nnit
   plot INfert_Nammda, INfert_Nnitda
   plot/run=2/xaxis=year/xhi=60, INfert_Nammda, INfert_Nnitda
   plot/run=2/xaxis=year/xhi=60, nstems, namm, Nnit 

!? grfert, and/or co 21900
end !gofert. 

proced grfert
   plot/xaxis = year, Namm, Nnit
   plot INfert_Nammda, INfert_Nnitda
   plot INfert_Nammda, INfert_Nnitda
   plot/run=2/xaxis = year, Namm, Nnit

end !grfert. 

! 43. 
proced gr1yrYr ( Y = jPARsc, run = 1 ) !Graph over 1st year, vs months.
   s xticpl = 1
   plot/xaxis = month_r/xhi = 12, /run=&run, runno, &Y
end !gr1yrYr.

! 44.
proced gryr ( Y = jPARdy ) !Graph over years.
   plot/xaxis = year/xhi = year, &Y
end !gryr.

! 45.
proced otreevrs !Output tree variables.
   oc
   output t, LAI, M??, hstem, dstem, Aleaf, Abr, Ast, Aco
end !otreevrs.

! 46.
proced onstems !nstems output list.
   oc
   output t, nstems, Dnstems, &
   Instems, Instems_sn, Instems_thyr, &
   Onstems, Onstems_sn, Onstems_th, &
   Onstems_thpl, Onstems_thyr
end !onstems.

! 47.
proced treechk
   d Ctree, Ntree, Wtree
   d ICtree, INtree, IWtree
   d OCtree, ONtree, OWtree
   d DCtree, DNtree, DWtree
   d DCtree_chk, DNtree_chk, DWtree_chk
end !treechk.


! 48.
proced treeCfluxes !Tree C fluxes.
   d Ctree, DCtree
   d ICtree, Pcan, Pcan_IP
   d OCtree, OCtree_atm, OCtree_soil, OCtree_th
   d OCth_pr, ICth_litter
end !treeCfluxes.

! 49. 
proced Ctreechk !Check C in tree compartments.
   d DCtree, DCbud_gnd
   d DCtree_chk, DCbud_gnd_chk
   d DCle_gnd, DCbr_gnd
   d DCle_gnd_chk, DCbr_gnd_chk
   d DCst_gnd, DCco_gnd, DCfi_gnd
   d DCst_gnd_chk, DCco_gnd_chk, DCfi_gnd_chk
end !Ctreechk.

! 50.
proced Ntreechk !Check N in tree compartments.
   d DNtree, DNbud_gnd
   d DNtree_chk, DNbud_gnd_chk
   d DNle_gnd, DNbr_gnd
   d DNle_gnd_chk, DNbr_gnd_chk
   d DNst_gnd, DNco_gnd, DNfi_gnd
   d DNst_gnd_chk, DNco_gnd_chk, DNfi_gnd_chk
end !Ntreechk.

! 51.
proced Wtreechk !Check W in tree compartments.
   d DWtree, DWbud_gnd
   d DWtree_chk, DWbud_gnd_chk
   d DWle_gnd, DWfi_gnd
   d DWle_gnd_chk, DWfi_gnd_chk
   d DWtreesum, DWtreesum_chk
end Wtreechk.

! 52.
proced checks !Checks accounting for C, N, W (water) in system and
              !main components, tree, soil (inc. litter), products, aphids.
   d maxt, t, year
   d DCsys, DNsys, DWsys
   d DCsys_chk, DNsys_chk, DWsys_chk
   d DCtree, DNtree, DWtree
   d DCtree_chk, DNtree_chk, DWtree_chk
   d DCsoil, DNsoil, DWsoil
   d DCsoil_chk, DNsoil_chk, DWsoil_chk
   d DCptrd, DNptrd, DWptrd 
   d DCptrd_chk, DNptrd_chk, DWptrd_chk
   d DCAph, DNAph, Daph
   d DCAph_chk, DNAph_chk, DAph_chk
end !checks.


! 53.
proced chks  !Other checks.
   d t, jPARsc_chk, jPARsc
   d DCbud_gnd_chk, DCbud_gnd
   d DNbud_gnd_chk, DNbud_gnd
   d DWbud_gnd_chk, DWbud_gnd
   d DMXle_chk, DMXle
   d DCle_gnd_chk, DCle_gnd !Not ok if sn on.
   d DNle_gnd_chk, DNle_gnd !Not ok if sn on.
   d DWle_gnd_chk, DWle_gnd
   d DCbr_gnd_chk, DCbr_gnd
   d DNbr_gnd_chk, DNbr_gnd
   d sgrMXst_chk, sgrMXst
   d Tblack_chk, Tblack
   d Vstem_chk, Vstem
   d DCst_gnd_chk, DCst_gnd
   d DNst_gnd_chk, DNst_gnd
   d DCco_gnd_chk, DCco_gnd
   d DNco_gnd_chk, DNco_gnd
   d DCfi_gnd_chk, DCfi_gnd
   d DNfi_gnd_chk, DNfi_gnd
   d DWfi_gnd_chk, DWfi_gnd
   d DCtree_chk, DCtree
   d ICph_CSle_chk, ICph_CSle !Not ok if sn on.
   d DNtree_chk, DNtree
   d uN_stem_chk, uN_stem     !not ok if sn on.
   d INsurf_li_chk, INsurf_li
   d ICth_surf_li_chk, ICth_surf_li
   d INth_surf_li_chk, INth_surf_li
   d DCsurf_li_chk, DCsurf_li
   d DNsurf_li_chk, DNsurf_li
   d ICth_soil_li_chk, ICth_soil_li
   d INth_soil_li_chk, INth_soil_li
   d ICth_litter_chk, ICth_litter
   d INth_litter_chk, INth_litter
   d DCsoil_chk, DCsoil
   d DNsoil_chk, DNsoil
   d DWsoil_chk, DWsoil
   d DWtree_chk, DWtree
   d DWtreesum_chk, DWtreesum
   d DWsys_chk, DWsys
   d Daph_chk, Daph
   d DCapta_chk, DCapta
   d DNapta_chk, DNapta
   d DCapti_chk, DCapti
   d DNapti_chk, DNapti

   d DCapt_chk, DCapt
   d DNapt_chk, DNapt
   d DCalaa_chk, DCalaa
   d DNalaa_chk, DNalaa
   d DCalai_chk, DCalai
   d DNalai_chk, DNalai
   d DCala_chk, DCala
   d DNala_chk, DNala
   d Raph_chk, Raph
   d DCaph_chk, DCaph
   d DCaph_m2_chk, DCaph_m2
   d DNaph_chk, DNaph
   d DNaph_m2_chk, DNaph_m2
   d DCptrd_chk, DCptrd
   d DNptrd_chk, DNptrd
   d DWptrd_chk, DWptrd
   d DCsys_chk, DCsys
   d DNsys_chk, DNsys
   d DEL_Csys_chk, DEL_Csys
   d DEL_Nsys_chk, DEL_Nsys
   d DEL_Wsys_chk, DEL_Wsys
   d Cpr_chk, Cpr
end !chks.

! 54.
proced Mtree !Display cpts of Mtree, all kg stem-1.
   d Mtree, MXtree, MStree
   d Mbud , MXle , MXbrtot , MXsttot , MXcotot , MXfitot
   d MXbr , MXbrm 
   d MXst , MXstm
   d MXco , MXcom
   d MXfi , MXfim
   d MSle , MSbr ,  MSst , MSco , MSfi
end !Mtree.
 
! 55.
proced DNsys !LHS variables of eqn " DNsys = ", units variable.
   d nstems, DMNtree, Dnstems, MNtree, DNsoil, &
     DNptd, DNprd, nstems, DNaph, Dnstems, Naph
end !DNsys.

! 56.
proced lichecks !Checks accounting for C, N in litter.
   d DCsurf_li, t, DNsurf_li
   d DCsurf_li_chk, DNsurf_li_chk
   d ICsurf_li, INsurf_li
   d OCsurf_li, ONsurf_li
end !lichecks.

! 57.
proced litterya !Litter yearly averages.
   d ICsurf_liya, INsurf_liya 
   d Csurf_li, Nsurf_li 
   d ICsoil_liya, INsoil_liya
   d Csoil_li, Nsoil_li
end !litterya.

! 58.
proced checkio !Check inputs and outputs to system and submodels.
   d DCsys, ICsys, OCsys
   d DNsys, INsys, ONsys
   d DCtree, ICtree, OCtree
   d OCtree, OCtree_atm, OCtree_soil
   d DNtree, INtree, ONtree
   d DCsoil, ICsoil, OCsoil
   d OCtree_soil, ICsoil
   d OCsoil, OCsoil_env
   d DNsoil, INsoil, ONsoil
   d INtree
   d ONtree, INtree_soil, INenv_soil
   d ONsoil, ONsoil_fi, ONsoil_env     
end !checkio.

! 59.
proced latitude (latitude_degc = 55.27) !Default, eskdalemuir, S Scotland.
   d latitude_degc
   s latitude_degc = &latitude_degc
   s title = 480 * ' '
   s title = 'Latitude = &latitude_degc'
end !latitude.


! 60.
proced gocalendar !Defaults applied, else comment out restore statement
   restore 
   oc; pc !Clear output and prepar lists.
   output iJulian, idaymo, imonth, &
          solar_dec_deg, &
          latitude_deg, daylengthhr, t, &
          solar_elevation_noon_deg, hourangle_dawn_deg, &
          solar_azimuth_dawn_deg
   prepar t, month_r, iJulian, idaymo, imonth, &
          solar_dec_deg, &
          latitude_deg, arg_daylength, acos_arg_daylength, &
          daylengthhr, tdawnhr, tduskhr, solar_elevation_noon_deg, &
          hourangle_dawn_deg, solar_azimuth_dawn*
   s cint = 1, nciout = 73, tstop = 365; 
   start
   d latitudedegc
   prfcalendar; prfTable2x1; grcalendar
end !gocalendar.

! 61.
proced grcalendar !Plots for current calendar settings,
   s xincpl = 6, xticpl = 0.5
   s yincpl = 4, yticpl = 1
   plot /xaxis = month_r/xhi=12, solar_dec_deg/lo=-45/hi=45
   plot arg_daylength, acos_arg_daylength
   plot daylengthhr/lo=0/hi=24
   plot hourangle_dawn_deg, tdawnhr
   plot solar_elevation_noon_deg/lo=-90/hi=90
   plot solar_azimuth_dawn_deg/lo=-180/hi=0
end !grcalendar.

! 62. 
proced prfcalendar (f = calendar.dat) !Print to file.
   print/f = '&f' month_r, idaymo, imonth, &
              latitude_deg, solar_dec_deg, &
              solar_elevation_noon_deg, daylengthhr, &
              solar_azimuth_dawn_deg, &
              tduskhr
end !prfcalendar.

proced prfTable2x1 (f = Table2x1.dat) !Print to file.
   print/f = '&f' month_r, idaymo, imonth, &
              iJulian
end !prfTable2x1.

! 63.
proced Nfluxes !Display N fluxes.
   d DNsys, INsys, ONsys
   d INsys, INenv_Namm, INenv_Nnit, INfix_Namm
   d ONsys, ONamm_vol, ONamm_nitrif_env, ONnit_denit, ONnit_lch, ONprd_env, &
     ONSle_atm_gnd
end !Nfluxes.

! 64.
proced mai !Maintenance. display only.
   d MNle_mai*
   d MNbr_mai*
   d MNst_mai*
   d MNco_mai*
   d MNfi_mai*
end !mai.

! 65.
proced Namm !Display only.
   d Namm, DNamm
   d INamm, INfi_Namm, INfix_Namm
   d INenv_Namm, INlitter_Namm, INbio_Namm
   d INSOM_Namm, INtree_fire_Namm
   d INsurf_li_fire_Namm
   d ONamm, ONamm_imm, ONamm_bioG
   d ONamm_nitrif, ONamm_vol, ONamm_rt
end !Namm.

! 66. 
proced Nnit !Display only.
   d Nnit, DNnit
   d INnit, INenv_Nnit, INamm_Nnit
   d ONnit, ONnit_imm, ONnit_bioG
   d ONnit_rt, ONnit_denit, ONnit_lch
end !Nnit.

! 67.
proced ONamm_rt !Display only.
   d ONamm_rt, nstems, uNamm
   d Namm, Neff_uN, zfNamm
   d uN_stem, kuN20, kuN, zNeff_uN, MXfi, denzuN
   d KCuN, Cfi, Nfi, JNuN, quN
end !ONamm_rt.

! 68.
proced dNsysya  !Display components of dNsysya.
   d DNsysya, INsysya, ONsysya
   d INsysya, INenv_Nammya, INenv_Nnitya, INfix_Nammya
   d ONsysya, ONamm_volya, ONamm_nitrif_envya, ONnit_denitya, &
     ONnit_lchya, ONprd_envya, ONSle_atm_gndya
end !dNsysya.

! 69.    
proced dstop !Display stop conditions, i.e. why run stopped: 
   d maxt, t, tstop
   d tdec, ihour, minute
   d idaymo, imonth, year
   d MCSbr, MCSst, MCSco, MCSfi, MNSfi
   d Cst, Nst
   d Nnit, Namm  !All above > 0
   d psifi, psifimax  !psifi < psifimax,
   d Wle, Wfi !Must be > 0.
   d s_water, psiPle, psiPle_wilt  !Water submodel on.  psiPle > psiPle_wilt
   d hstem, href !hstem > href. !Boundary layer conductance calc fails.
   d s_diurnal_dat, zdi_t1t2, t_di2_di1 !Stop if zdi_t1t2 >1, or if
     !t_di2_di1<=0 then there is Fault in diurnal data file (ddf), or end of
     !ddf.
   d imonth_mon2 !Is this zero for end of many months data file (mnn)?
   d idaymo_dy   !Is this zero for end of daily data file (daily.dat)?
end !dstop.

! 70.
proced vr (vr = 1) !This proced switches tree, soil and litter variables,
                   !and water state variables to be constant ( vr 0 ) or 
                   !to vary "normally". (vr 1).  We also turn the water
                   !submodel off to present failure.
   d treevr, soilvr, watervr, s_water
   !quit  !ok to here
   s treevr = &vr, soilvr = &vr, watervr = &vr, s_water = &vr
   d treevr, soilvr, watervr, s_water
   !quit  !ok to here with all the 4 above = 0 after "vr 0"
end !vr.

! 71.
proced final !Display results at end of rotation or run.
   !Time variables:
      d t, hour              !Check that hour = 0.
      d daybeg, yearbeg      !These should both be TRUE.
      d year, irotate, nthin !Check that year is correct eg for a 60-year
                             !rotation. irotate, nthin give the number of
                             !rotations and thinnings.
      d s_selfthin, s_prune, fpruneyr !Selfthinning, thinning/pruning
                             !constants.
      d t, sum_dy_av !This is a check.  sum_dy_av should be equal to t.
      d chk_yr_av    !This is a check.  It should = 1.
    
   !Values of variables at end of rotation or run:
      d LAI, LAI_1???15h, hstem, dstem, rhdstem, MXst  !LAI, stem height (m),
                     !stem diameter (m), height:diameter ratio, 
                     !stem mass (kg structural DM).
      d Ctree, Ntree      !C, N in trees (kg C, N m-2).
      d nstems, Vstem, Vstem_gnd  !Stem number (m-2), stem vol (m3), 
                                  !stem vol [m3 (m2 ground)-1].
      d Cpt, Cpr, Cptr    !Mass of C products in thinnings, clearance at
                          !end of rotation, thinnings + clearance.
                          !No decay of products.  [kg C (m2 ground)-1].
                          !These are only meaningful in plantation mode.
      d Npt, Npr, Nptr    !the same for N.
      d CuSOM, CpSOM, CsSOM !C in 3 SOM pools.
      d NuSOM, NpSOM, NsSOM !N in 3 SOM pools.
      d Clitter, Nlitter    !Total litter C, N.
      d Csurf_li, Nsurf_li  !Surface litter C, N.
      d Csoil_li, Nsoil_li  !Soil litter C, N.
      d Csoil, Nsoil      !Total soil C and N (kg C, N m-2).
      d Csys, Nsys        !System C and N (kg C, N m-2).
      d rstX_Ctot         !Ratio of stem structural dry matter to total stem
                          !carbon [kg DM (kg C)-1].

   !Variables averaged over the last rotation (or at end of run):
      !Property variables:
      !Tree:
      d LAI_av            !Leaf area index.
      d rCNle_av rCNfi_av !Ratio of C substrate to N substrate in foliage
                          !and in fine roots [kg C (kg N)-1].
      d CStree_av, NStree_av  !Mean C and N substrate levels in tree
                          ![kg C, N (kg structural DM)-1].
      d fCSmai_tree_av    !Fractional effect of C substrate in decreasing 
                          !maintenance.
      d Nletot_av
           !N concn in foliage. [kg total N (kg total DM)-1]. 
      d Ctree_av, Ntree_av 
                                !Mass of total C, N in tree (kg C, N m-2).
      !Products:
      d Cptrd_av, Nptrd_av       !Mass of C, N in decaying products pool 
                                 !(kg C, N m-2).
      d rCNptrd_av               !C/N ratio in total products pool (thinning
                                 !+ rotation, decaying).  kg C / kg N.
      !Soil, litter:
      d Namm_av, Nnit_av, Nmin_av !Soil ammonium, nitrate, total (kg N m-2).
      d Cbio_av                  !Soil biomass (kg biomass DM m-2).
      d Clitter_av, Nlitter_av   !C, N content in litter.
      d Csoil_av, Nsoil_av       !C, N in soil (SOM, biomass, litter, Csol).
      d rCNsoil_av               !ratio, C:N for soil [kg C (kg N)-1].
      d CSOM_av, NSOM_av         !same for soil organic matter (SOM).
      d rCNSOM_av                !ratio, C:N for SOM pools.

      !System:
      d Csys_av, Nsys_av         !Total system C, N (kg C, N m-2).
      d rCNsys_av                !ratio, C:N for system [kg C (kg N)-1].


      !Flux variables:
      !Carbon fluxes (kg C m-2 yr-1):
      d ICsys_av_yr, OCsys_av_yr    !System C total input, output.
      d Pcan_av_yr, Pnet_av_yr      !Gross, net photosynthesis.
      d rPnet_Pcan_av_yr            !Ratio of above.
      d Rtreem_av_yr, RtreeG_av_yr  !Maintenance, growth respiration.
      d OCsol_lch_av_yr             !C leaching.
      d Rsoil_av_yr                 !Litter and soil respiration.  An output.
      d OC_ptr_av_yr  !Cptr/year. Cptr pool is for all products from the trees,

                      !from thinning, pruning, clear-felling, no decay, 
                      !put on a per year basis over the rotation or simulation.
      d OCprd_av_yr     !Output from all decaying product pools.

      !Volume fluxes (all are m3 ha-1 year-1):
      d Vstem_hayr     !Stem volume.
      d Vptr_hayr      !Volume of all products. Yield class.
                       !Only meaningful in plantation mode.
      d Vpt_hayr, Vpr_hayr !Breakdown of Vprt_hayr to thinnings + rotation.
      d Vpth_haya       !Continuous thinning of natural forest.

      !N fluxes (kg N m-2 year-1):
      d INsys_av_yr, ONsys_av_yr          !Total N in and out of system.
      d INenv_dep_av_yr, INfix_Namm_av_yr !N inputs from deposition and
                                          !N fixation.
      d ONnit_lch_av_yr, ONamm_vol_av_yr & 
        ONamm_nitrif_env_av_yr, ONnit_denit_av_yr, ONtree_ptr_yr
                     !N losses to leaching, volatilization, nitrification, 
                     !denitrification, products
      d ONSle_atm_gnd_av_yr   !Ammonia emissions from foliage.
      d ONsoil_gas_av_yr      !Gaseous losses from soil (vol + nit + denit).
      d ONsys_gas_av_yr       !System gaseous losses (amm+vol+nit+denit).
      d ONtree_ptr_yr !Nptr/year. Nptr pool is for all products from trees,
                      !from thinning, pruning, clear-felling, no decay, 
                      !put on a per year basis over the rotation or simulation.
      d ONprd_av_yr     !Averaged N output from the decaying products 
                        !pool (thinning + rotation).

      !Water submodel:
         d thetale_av, thetasoil_av  !Foliage, soil relative water contents.
      !Water fluxes (m year-1 averaged over the rotation):
         d IWsys_av_yr, OWsys_av_yr  !System inputs (rainfall) and outputs.
         d OWrain_int_av_yr, OWle_atm_gnd_av_yr, &
           OWso_atm_av_yr, OWso_drain_av_yr
         !Interception by canopy and evaporation, evapotranspiration,
         !direct evaporation from soil, drainage. 

   !Midnight daily values averaged over the rotation:
   !Leaf area ratio = foliage mass / total tree mass (m2 kg-1):
      d LAR_0h_sum_av 
   !Specific leaf area = foliage area / total foliage mass (m2 kg-1):
      d SLA_0h_sum_av 
   
   !Averages over the rotation of 1 July 15 h values:
      d Pcan_1???15h_av 
                             !Gross photosynthesis [kg C (m2 ground)-1 s-1].
      d Pmax_1???15h_av   !Pmax of leaf response [kg C (m2 leaf)-1 s-1].
      d alpha_1???15h_av  !Photosynthetic efficiency [kg C (kg J PAR)-1].
      d thetale_1???15h_av !Foliage relative water content.
      d gstom_1???15h_av  !Leaf stomatal conductance (m s-1).
      d psiPle_1???15h_av !Pressure component of foliage water potential
                             ![J (kg water)-1].
      d thetasoil_1???15h_av !Soil relative water content.
end !final.

! 72,
proced Nle !Display foliage N variables.
   d MXle, fNleX
   d Nletot_X, Nle, NXle, Nph, Nph_can
   d Nph_A, Nletot_A
   d SLA, SLAXnew 
end !Nle.

! 73.
proced litter_all_met  !Make the litter all metabolic, by setting met
      !fraction = 1 and cel and lig fractions equal to zero.
      !fractions equal to zero.
   d fCrtli_met, fCrtli_cel, fCrtli_lig
   d fCshli_met, fCshli_cel, fCshli_lig 
   s fCrtli_met = 1, fCrtli_cel = 0, fCrtli_lig = 0
   s fCshli_met = 1, fCshli_cel = 0, fCshli_lig = 0
end !litter_all_met.

! 74.
proced wateroff  !Turn off water submodel and leaching.
   s s_water, watervr, s_leach
   s s_water = 0, watervr = 0, s_leach = 0
end !wateroff.

! 75.
proced envdataswitches !Environmental data switches, default filenames
   !See proced envpars ! 132
   d s_diurnal_dat, s_daily_dat, s_months12_dat, s_CLINO_dat, &
     s_monthsnn_dat, s_cd
   d filenamedi, filenamedy
   d filenamem12, filenameCLINO
   d filenamemnn,  filenamecd
   d nyears_rw_di
   !Procedures are: diurnaldata, dailydata, months12data, CLINOdata, 
   !monthsnndata in cmd file monthsnn.cmd
   d s_*cc !Climate change switches. s_CO2cc, s_Tcc, s_windcc = 0.
end !envdataswitches.

! 76.
proced diurnaldata (s_diurnal_dat = 1, filenamedi = diurnal.dat, &
                     nyears_rw_di = 5 )
   !Diurnal environmental data input from file.
   !Default: switches on reading of file diurnal.dat and &
      !gives a rewind of the file after 5 yrs.
   !To change matters, e.g. type diurnaldata 1, myfile.dat, 5
      !switches on reading the file myfile.dat, and rewinds the file
      !after 5 years, i.e. starts reading at the beginning again.
   !Type diurnaldata 0 to switch off reading diurnal data and return
      !everything to default (Internal sinusoidal data used). 
   !Note that if a run is finishing at the end of year 10 (say), then
      !two lines of data for the next year must be provided, otherwise
      !failure occurs.  See end of file diurnal.dat.
      d s_diurnal_dat, s_daily_dat, s_months12_dat, s_monthsnn_dat, &
        s_cd, filenamedi 
      s s_diurnal_dat = &s_diurnal_dat, s_daily_dat = 0 
      s s_months12_dat = 0, s_monthsnn_dat = 0, s_cd = 0
      s filenamedi = 20 * ' '   !Clear character array.
      s filenamedi = '&filenamedi' !Default, diurnal.dat
      s nyears_rw_di = &nyears_rw_di !default, 10,000
end !diurnaldata.

! 77.
proced dailydata (s_daily_dat = 1, filenamedy = daily.dat)
                !Daily environmental data input from default file daily.dat.
   d s_diurnal_dat, s_daily_dat, &
     s_months12_dat, s_CLINO_dat, s_monthsnn_dat, &
     s_cd, filenamedy
   s s_diurnal_dat = 0, s_daily_dat = &s_daily_dat, s_months12_dat = 0
   s s_CLINO_dat = 0, s_monthsnn_dat = 0, s_cd = 0
   s filenamedy = 20*' '  !Clear character array.
   s filenamedy = '&filenamedy'
end !dailydata.

! 78.
proced dailydataout ( s_dy_dat_out = 0 ) !Default 0. If set to 1, with eg
   !"dailydataout 1", then daily data output to file dailyout.dat.
   d s_dy_dat_out
   s s_dy_dat_out = &s_dy_dat_out 
end !dailydataout.

! 79.
proced months12data (s_months12_dat = 1, filenamem12 = months12.dat)
   !12 months environmental data. Default is months12.dat, which is a copy of
   !Eskdale.dat, for Eskdalemuir.
   d s_diurnal_dat, s_daily_dat, s_months12_dat, s_monthsnn_dat, &
     s_cd, filenamem12
   s s_diurnal_dat = 0, s_daily_dat = 0.0, &
     s_months12_dat = &s_months12_dat, s_CLINO_dat = 0, &
     s_monthsnn_dat = 0, s_cd = 0
   s filenamem12 = 20*' '  !Clear character array.
   s filenamem12 = '&filenamem12'
end !months12data.

! 80.
proced CLINOdata (s_CLINO_dat = 1, filenameCLINO = CLINO.dat)
            !12 months CLINO data.
   d s_diurnal_dat, s_daily_dat, s_months12_dat, s_CLINO_dat, & 
     s_monthsnn_dat, s_cd, filenameCLINO
   s s_diurnal_dat = 0, s_daily_dat = 0.0, s_months12_dat = 0, &
     s_CLINO_dat = &s_CLINO_dat, s_monthsnn_dat = 0, s_cd = 0
   s filenameCLINO = 20*' '   !Clear character array.
   s filenameCLINO = '&filenameCLINO'
   s s_dy_dat_out = 1  !Output daily data to file dailyout.dat 
                    ! You cannot open this file until you quit acsl
end !CLINOdata.

! 81.
proced goenvs !Run for 1 year with all the environmental data options.
   oc
   output t, idaymo, imonth, &
       iJulian, runno, year, &
       cint, nciout, maxt, &
       jPARsc, Tair, wind, &
       LAI, Namm, aph
   rw; 
   r1dy !To initialize daily quantities.
   s runno = 1
   r1yr; nrw   !internal sinusoidal data. run 1.

   s runno = 2
     diurnaldata;  !addresses diurnal.dat by default.
     start !r1yr !run 2  Fails at t = 213.0, iJulian = 214
!Invalid floating point number
!Stop flag set
!Seems to run ok if you then do: "co 365" from the keyboard.
!gr1yrYr ( Y = jPARsc, run = 1 ) 
   s runno = 3
      dailydata;    r1yr !run 3
   s runno = 4
      months12data; r1yr !run 4
   s runno = 5
      CLINOdata; r1yr    !run 5
   s runno = 6
      monthsnndata; r1yr !run 6 Care: proced also in cmd file monthsnn.cmd
   s runno = 7
   monthsnndata 0 !Switch off monthsnn data input so that
                  !climate data is applied to the sinusoidal internal data.
                  
   climatedata;  r1yr !run 7
   s runno = 8
   climatedata 0; r1yr !run 8. Return to internal sinusoidal data.
   gr1yrYr !( Y = jPARsc, run = 1 ) 
end !goenvs.
   
! 82.
proced env !Display instantaneous environment
   d t, hour, idaymo, &
     imonth, year  
   d jPARsc, Tair, Tsoil, &
      rain, wind, RH, &
      INenv_Namm, INenv_Nnit, CO2vpm
end !env.

! 83.
proced envda !Display environment, daily averages.
   d t, hour, idaymo, &
      imonth, year, yearno
   d jPARscda, Tairda, Tsoilda, &
      rainda, windda, RHda, &
      INenv_Nammda, INenv_Nada, &
      INenv_Nnitda, INenv_Nnda, CO2vpm
   d dychda, dychdb, dychchkdb;  !Check on method.
end !envda.

! 84.
proced envdb !Display environment, daily averages calculation.
   d t, hour, idaymo, &
      imonth, year, yearno
   d jPARscdb, Tairdb, Tsoildb, &
      raindb, winddb, RHdb, &
      INenv_Nammdb, INenv_Nadb, &
      INenv_Nnitdb, INenv_Nndb, CO2vpm
   d dychda, dychdb, dychchkdb; !Check on method.
end !envdb.

! 85.
proced envya !Display environmental yearly averages.
   d t, hour, idaymo, imonth, iJulian, yearno
   d jPARscya, Tairya, Tsoilya, rainya, windya, RHya, &
      INenv_Nammya, INenv_Nnitya, CO2vpm
end !envya.

! 86.
proced grenvya (xhi = year) !Graph environmental yearly averages.
   plot /xaxis=year, /xhi=year, jPARscya
   plot Tairya
   plot Tsoilya
   plot rainya
   plot windya
   plot RHya
   plot INenv_Nammya
   plot INenv_Nnitya
   plot CO2vpm
   plot fTshya
   plot fTrtya 
   plot fT_Pmaxya
   plot LAIya
   plot jPARscya
   plot Pcanya
   plot gstom_1jul15h
end !grenvya.

! 87.
proced goded (tstop = 365) !Run 1 (or more) years to examine daily
            !environmental data.
   !Do set the environment (if required), eg with
      months12data !Addresses Eskdalemuir monthly data. Otherwise the
      !efm uses internally generated sinusoidal data for Eskdalemuir.
      !Other options are possible. months12data 0 switches off monthly data.

   rw            !Rewind.
   oc; oded      !Output daily environmental data.
   s maxt = one128th
   !Run 1 yr to initialize everything.
      s cint = 1, nciout = 73, tstop = 365; start

   !Run 1 year:
      s cint = 1, nciout = 73, tstop = &tstop; start

   prfded !Print ded to files.
   grded  !Plot ded data.
end !goded.

! 88. 
proced gocfenv !Compare environments.
   oded !Set up prepare and output lists.
   rw !Rewind.
   !Run for 1 year to initialize everything:
      s cint = 1, nciout = 73, tstop = 365; start

      !months12_dat kew.dat       !Kew monthly data.
   s runno = 1
   start !Default should be eskdal sinusoidal environment.

   nrw !No rewind.
      !months12_dat Albert.dat  !Prince Albert (Canada) monthly data.
   !Eskdal !Use procedure eskdal in efm.cmd.
   Hurley !Use procedure hurley in efm.cmd.
   start
   Eskdal; start
   print/run=1/f='kewded.dat', &
      month_r, rain, Tairmax, Tairmin, Tairda, Tsoil, Tsoilda, &
      RHmax, RHmin, RHda, windda, jPARdye_6, jPARsc_12h, fsun_12h, daylengthhr
   print/run=2/f='princded.dat', &
      month_r, rain, Tairmax, Tairmin, Tairda, Tsoil, Tsoilda, &
      RHmax, RHmin, RHda, windda, jPARdye_6, jPARsc_12h, fsun_12h, daylengthhr
   s nciprn = 365
   print year, rainya, Tairya, Tsoilya, RHya, jPARscya, windya
   s nciprn = 1
end !gocfenv.

! 89.
proced ded  !Display daily environmental data.
   d idaymo, imonth, month_r, &
      CO2vpm, jPARdy, INenv_Namm, &
      Tairmax, Tairmin, Tairdymn, &
      Tairdyvr, Tsoil, rain, &
      RHmax, RHmin, windmax, &
      windmin, winddymn, winddyvr, &
      daylengthhr
end !ded.

! 90.
proced windmax !Display quantities involved in calculation of windmax.
   d windmax, one_s_daily_dat, one_s_CLINO_dat, one_s_monthsnn_dat
   d windmaxmn1, windmaxvr, zwsin1m, windmaxvrzwsin1m
   d s_daily_dat , windmax_dy , s_CLINO_dat 
   d windmax_CLINO , s_monthsnn_dat , windmax_mnn
end !windmax.

! 91. 
proced oenv !Output instantaneous environment.
   oc
   output t, idaymo, imonth, &
          Tair, jPARsc, jPARsc_12h, &
          Tsoil, rain, wind, &
          RH, INenv_Namm, CO2vpm
end !oenv.

! 92. 
proced oded  !Output of daily environmental data.
   output/clear
   output t, ijulian, yearno, &
      idaymo, imonth, month_r, &
      CO2vpm, filenamem12, jPARscda, Tairda, &
      Tsoil, jPARdy_yday, INenv_Nada, &
      INenv_Nnda, INenv_Nam_mg, INenv_Nni_mg, &
      RHda, rain, Tairmax, &
      Tairmin, RHmax, RHmin, &
      jPARdy, jPARsc_12h, fbshrs, &
      fsun_12h, windmax, windmin, &
      Tsoil, daylengthhr, daybeg, &
      yearbeg, Iday, Idaycount
end !oded.

! 93.
proced grenv !Graphs of environment.
   plot /xaxis = t, jPARdy
   plot Tair/lo = 0/hi = 50
   plot Tsoil/lo = 0/hi = 20
   plot rain/lo = 0/hi = 5
   plot wind/lo=0/hi=10
   plot RH/lo=0.5/hi = 1
end !grenv.

! 94. 
proced grded (xhi = month_r) !Graphs of daily environmental data.
   s xincpl = 6, xticpl = 0.5
   plot /xaxis = month_r, /xlo = 0.0, /xhi = &xhi, rain/lo=0/tag='mm d-1'
      pause
   plot Tairmax/lo=-20/hi=30, Tairmin/same
      pause
   plot Tairda, Tsoilda/same
      pause
   plot Tairdymn, Tairdyvr/same
      pause
   plot Tairdyvr/lo=0/hi=10
      pause
   plot AtmP/lo=0/hi=20000/tag = 'Pa, only if s_clino_dat = 1'
      pause
   plot RHmax/lo=0.5/hi=1.0
      pause
   plot RHmin/lo=0.5/hi=1.0
      pause
   plot RHmax/lo=0/hi=1, RHmin, RHda/same
      pause
   plot jPARdye_6
      pause
   plot jPARsc_12h/lo=0/hi=500
      pause
   plot windmax/lo=0/hi=10, windmin, wind/same
      pause
   plot fsun_12h/lo=0/hi=1
      pause
   plot fbshrs/hi=1
      pause
   s yticpl = 1.25; plot daylengthhr/lo=0/hi=24; s yticpl = 1
      pause
end !grded.

! 95.
proced prfded !Print to text (.txt) files daily environmental data.
   s tcwprn = 100000
   print /f = 'ded.txt', month_r, imonth, idaymo, &
      CO2vpm, jPARscda, jPARdy, &
      Tairmax, Tairmin, Tairda, Tsoil, &
      RHmax, RHmin, RHda, rain, 7
      windmax, windmin, daylengthhr, &
      fsun_12h, fbshrs, INenv_Nada, &
      Tairdymn, Tairdyvr, RHmax, RHmin, AtmP, VapP

   print /f = 'ded1.txt', month_r, imonth, idaymo, &
      CO2vpm, jPARscda, jPARdy, &
      Tairmax, Tairmin, Tairda, Tsoil

   print /f = 'ded2.txt', month_r, imonth, idaymo, &
      RHmax, RHmin, RHda, rain, AtmP, VapP

   print /f = 'ded3.txt', month_r, imonth, idaymo, &
      windmax, windmin, daylengthhr, &
      fsun_12h, fbshrs, INenv_Nada

   print /f = 'ded4.txt', imonth, idaymo, Tairdymn, Tairdyvr, RHmax, RHmin

   print /f = 'ded5.txt', imonth, idaymo, Tsoil, Tairdymn, Tairdyvr 
   s tcwprn = 80
end !prfded. ! 95.

! 96.
proced prsya !Print to screen yearly averages, sums.
   s nciprn = 365
   print year, rainya, Tairya, Tsoilya, RHya, jPARscya
   s nciprn = 1
end !prya.

! 97.
proced CO2 ( CO2vpmc = 350 )  !To reset CO2 concn (vpm).
   !Type <co2 700> to set CO2 to 700 vpm.
   d CO2vpmc  !Current value.
   s CO2vpmc = &CO2vpmc
end !CO2.

! 98.
proced light ( jPARdymn = 3.8e6 ) !To reset the daily mean light receipt
   !Type <light 10.0e6> to set daily light receipt to 10 MJ PAR m-2 day-1.
   d jPARdymn  !Current value, Eskdalemuir. Used for sinusoidal generation
               !of daily light receipt, jPARdy (default)
   s jPARdymn = &jPARdymn
end !light.

! 99.
proced Tinc ( T_inc = 0 ) !Increase temperatures by 0 deg C.
   !Type <T 5> to increase temperatures by 5 deg C.
   d Tair_inc, Tsoil_inc  !Current values.
   s Tair_inc = &T_inc, Tsoil_inc = &T_inc
end !Tinc.

! 100.
proced litter0 !Set all inputs and outputs to litter pools to zero, 
               !except for thinning.
   !Litter inputs:
      d kXle_li20, kXbr_li20, kXco_li20, kXfi_li20
      s kXle_li20 = 0.0, kXbr_li20 = 0.0, kXco_li20 = 0.0, kXfi_li20 = 0.0
   !Litter outputs:
      d ksurf_li_met20, ksurf_li_cel20, ksurf_li_lig20 
      d ksoil_li_met20, ksoil_li_cel20, ksoil_li_lig20 
      s ksurf_li_met20 = 0.0, ksurf_li_cel20 = 0.0, ksurf_li_lig20 = 0.0
      s ksoil_li_met20 = 0.0, ksoil_li_cel20 = 0.0, ksoil_li_lig20 = 0.0
end !litter0.

! 101. 
proced init (f = sn.sav) !Initialize with steady state initial values,
           !sn = self-thinning for eskdalemuir sinusoidal environment.
   restore/f = '&f'      !Default file used is sn.sav.
                          !To use a different file, type <init myfile.abc>.
   s calcics = .f.    !Do not recalculate initial values in initial section.
   s tic = 0          !Reset time to zero.
end !init.

! 102. 
proced saveics (f = old.sav)  !Saves initial conditions to file.
   reinit   !Transfer current values of state variables into their initial
            !conditions.
   save/f = '&f'/ics/nobinary !save the initial values.  No reinitialization.
                           !Default file is old.sav. To save to a 
                           !different file, type <saveics myfile.abc>.
   d nstart !from efm.cmd, proced saveics (f = old.sav)
end !saveics.

! 103. 
proced ce !Set to a constant environment, water submodel off, 
   !and 20 C for reference values.
   s s_diurnal = 0                  !Turn off diurnal variation.
   s s_seasonal = 0                 !Turn off seasonal variation.
   s s_water = 0, watervr = 0       !Switch off water submodel.
   s Tairmaxmn = 20, Tairmaxvr = 0  !20 C air and soil temperatures.
   s Tairminmn = 20, Tairminvr = 0
   s Tsoilmn = 20, Tsoilvr = 0
end !ce.

! 104. 
proced T20 (T = 20) !Set temperatures to a constant 20 C, or "T20 15"
   d Tairmaxmn , Tairmaxvr !air and soil temperatures.
   d Tairminmn , Tairminvr 
   d Tsoilmn , Tsoilvr 
   s Tairmaxmn = &T, Tairmaxvr = 0  !20 C air and soil temperatures.
   s Tairminmn = &T, Tairminvr = 0
   s Tsoilmn = &T,   Tsoilvr = 0
end !T20.

! 105. 
proced aphid (x = 1, alaa0 = 10)   
   !Switch the aphid submodel on/off, aphid 1  10/ aphid 0  0 
   !and fix the initial values.  Only relevant if running from t = 0.
   !Otherwise, eg s alaa = 10 and reset tstop, and do a continue.
   !To enable the aphid submodel, type <aphid>. This sets s_aphid, aphidvr
   != 1, puts 10 aphids/stem into the alate adult aphid box, and sets all
   !other aphid initial values to 0.

   s s_aphid = &x, aphidvr = &x
   s alaa0 = &alaa0
   s ala10 = 0, ala20 = 0, ala30 = 0, &
                      ala40 = 0
   s apt10 = 0, apt20 = 0, apt30 = 0, &
                      apt40 = 0, apta0 = 0
   !To see aphid initial values, "aphidics".
   !Check aphid ics with (after start) d Aph_t0
   !To disable the aphid submodel, type <aphid 0  0> 
end !aphid.

! 106.
proced aphidics !Display aphid initial conditions. 
   d ala10, ala20, ala30, ala40, alaa0    
   d apt10, apt20, apt30, apt40, apta0    
end !aphidics.           

! 107.
proced aphidchecks !Check C and N balance in aphid submodel.
   d DCAph, DNAph
   d DCAph_chk, DNAph_chk
   d DCapta, DNapta
   d DCapta_chk, DNapta_chk
   !Also:
   d *a?_chk, dcalaa, dcalai, dnalaa, dnalai
end

! 108.
proced oaphid !Output aphid
   oc
   output t,    LAI,  MXst, &
          apt, ala, Aph, &
          apt_Aleaf, ala_Aleaf, Aph_Aleaf, &
          Aleaf, Aleaf_aph
end !oaphid.

! 109.
proced paphid !Prepare aphid
   pc !Prepar/clear.
   prepar t, year, month_r
   prepar LAI, MXst, Cle, Nle, &
          Cphloem, Nphloem, rCNphloem
   prepar ala1, ala2, ala3, ala4, alaa, &
          apt1, apt2, apt3, apt4, apta
   prepar Dala1, Dala2, Dala3, Dala4, Dalaa, &
          Dapt1, Dapt2, Dapt3, Dapt4, Dapta
   prepar apt, ala, Aph
   prepar apt_Aleaf, ala_Aleaf, aph_Aleaf
   prepar OCaph_hon, OCapt_hon, OCala_hon, OCapta_hon, OCalaa_hon
end !paphid.

! 110.
proced graphid !4 aphid plots
   s xticpl = 1 !was 1.2
   plot /xaxis = year, apta, apt1, apt2, apt3, apt4/same
   plot alaa, ala1, ala2, ala3, ala4/same
   plot aph, apt, ala/same
   plot aph_Aleaf, apt_Aleaf, ala_Aleaf/same
end !graphid.

! 111.
proced raph1yr !Run 1 year, no aphid initialization 
   rw
   oaphid
   s tstop = 365, cint = 73, nciprn = 1
   paphid
   start
   graphid
end !raph1yr.

! 112.
proced bma !To examine growth of biomass alone.
   d s_bio_alone, soilvr  !Look at efm.csl.
   s s_bio_alone = 1 !and also
   s soilvr = 0 !which keeps
                !the substrate Namm, Nnit and Csol constant at
                !their initial values.  You may also wish to
   s s_diurnal = 0, s_seasonal = 0, Tairmaxmn = 20, Tairminmn = 20, &
     Tsoilmn = 20  
                  !which keeps temperature at 20 deg C and
   s s_water = 0  !switches off any water limitation.
end !bma.

! 113.
proced climatedata (x = 1, f = climate.dat) !Points to proced cd below.
   cd &x &f
end !climatedata.

! 114. 
proced cd (x = 1, f = climate.dat) !Switches on/off climate data read from 
  !default file climate.dat
   d s_cd !Climate change data switch. Set to 1 to read climate.dat.
   d nyrsofcd, filenamecd
   s s_cd = &x, filenamecd = '&f'
   d iyearcd_A
   d delTcd_A
   d CO2cd_A
   d Ndepcd_A
   d s_cd, nyrsofcd, filenamecd
end !cd. 

! 115.
proced CO2cc (x = 1) !Switches on/off linear increase in CO2 concentration.
   s s_CO2cc = &x 
   d CO2vpmc      !See efm.csl.
   d CO2inc_yr 
   d yrsCO2offset 
end !CO2cc.

! 116.
proced deciduous (x = 1) !Deciduous mode or evergreen mode (deciduous 0)
   d s_deciduous, s_leaf, scleafic, budsopening
   s s_deciduous = &x !Switch on deciduous mode.
end !deciduous.

! 117.
proced thin ( s_thin = 1 ) !switches thinning on/off, displays thinning
   !parameters, with the standard thinning parameters.
   !To switch thinning off, type "thin 0"

   d nstems0  !Stems m-2. Initial planting density.
   d s_thin   !Is thinning switched on (1), or off (0)?
   !Switch off/on standard thinning regime:
      s s_thin = &s_thin  !Thinning is turned on by default.
                          !<thin 0> turns off thinning.
   !Display default thinning parameters:
      d nthin           !Number of thinnings.
      d tthin           !Times when thinning occurs.
      d fst_rem_th      !Fractions of stem numbers removed at each thinning.
      d fbr_rem_th_prod, fst_rem_th_prod
        !Fractions of branches, stems removed in thinning that go to products.
      d fbr_rot_prod, fst_rot_prod
        !Fractions of branches, stems at end of rotation that go to products.
end !thin.

! 118. 
proced thint0 ( s_thin = 1 ) !Thin at time 0, over the first day.
   d nstems0  !Stems m-2. Initial planting density.
   d s_thin   !Is thinning switched on (1), or off (0)?
   !Switch on thinning:
      s s_thin = &s_thin  !Thinning is turned on by default.
                          !<thin0 0> turns off thinning.
   !Display default thinning parameters:
      d nthin           !Number of thinnings.
      s nthin = 1
      d tthin           !Times when thinning occurs.
      s tthin = 15 * 1.0E15 !Set all to a large number.
      s tthin(1) = 0 !Thinning occurs at t = 0, over the first day.
      d fst_rem_th      !Fractions of stem numbers removed at each thinning.
      s fst_rem_th = 15 * 0.0 !Set all thinning fractions to zero.
      s fst_rem_th(1) = 0.5
      d fbr_rem_th_prod, fst_rem_th_prod
        !Fractions of branches, stems removed in thinning that go to products.
      d fbr_rot_prod, fst_rot_prod
        !Fraction of branches, stems at end of rotation that go to products.
      d s_rotate !This should be zero, unless required otherwise.
end !thint0.

! 119.
proced thinbeech ( s_thin = 1 ) !Display current values of thinning parameters.

  !then set them for beech.
   d tstop
   !s tstop = 32850 !90 year rotation.
   d nstems0  !Stems m-2. Initial planting density.
   s nstems0 = 0.5
   d s_thin   !Is thinning switched on (1), or off (0)?

   !Switch on standard thinning regime:
      s s_thin = &s_thin  !Thinning is turned on.
     !<thin 0> turns off thinning, but doesn't reset any other
     !thinning parameters
   pause

   !Display default thinning parameters:
      d nthin           !Number of thinnings.
      s nthin = 13
      d tthin           !Times when thinning occurs.
      s tthin = 9125, 10950, 12775, 14600, 16425, &
               18250, 20075, 21900, 23725, 25550, &
               27375, 29200, 31025, 1.0e15, 1.0e15  !days.
           !Thinning occurs at:
              !25, 30, 35, 40, 45, 
              !50, 55, 60, 65, 70, 
              !75, 80, 85 years.
      pause
      d fst_rem_th      !Fractions of stem numbers removed at each thinning.
      s fst_rem_th = 0.20, 0.32, 0.30, 0.26, 0.21, &
                     0.18, 0.16, 0.15, 0.14, 0.13, &
                     0.11, 0.10, 0.10, 0.0, 0.0
      pause
      d fbr_rem_th_prod, fst_rem_th_prod  !Fraction of branches, stems
                        !removed in thinning that go to products.
      s fbr_rem_th_prod = 0.5, fst_rem_th_prod = 0.9
      d fbr_rot_prod, fst_rot_prod  
         !Fraction of branches, stems at end of
         !rotation that go to products.
      s fbr_rot_prod = 0.75, fst_rot_prod = 0.95
end !thinbeech.

! 120.
proced thinsitka ( tstop = 21900, s_thin = 1 )
   !Display current values of thinning parameters. Then set them for sitka.
   !Environment is standard Eskdalemuir sinusoidal environment.
   d tstop
   s tstop = &tstop !60 year rotation.
   d nstems0  !Stems m-2. Initial planting density.
   s nstems0 = 0.25
   d s_thin   !Is thinning switched on (1), or off (0)?

   !Switch on standard thinning regime:
      s s_thin = &s_thin  !Thinning is turned on.
     !"thinsitka 0" turns off thinning ??, but doesn't reset any other
     !thinning parameters.
   pause

   !Display default thinning parameters:
      d nthin           !Number of thinnings.
      s nthin = 8
      d tthin           !Times when thinning occurs.
      s tthin = 7300,  9125, 10950, 12775, 14600, &
               16425, 18250, 20075, 1.0e15, 1.0e15, &
               1.0e15, 1.0e15, 1.0e15, 1.0e15, 1.0e15  !days.
           !Thinning occurs at:
              !25, 30, 35, 40, 45, 
              !50, 55, 60 years.  No of stems standing/m2 :
     !Year   0    21     26     31     36        41         46       
     !nstems 0.25 0.1375 0.0825 0.0536 0.0375375 0.02815313 0.0225250
     !year   51         56         60 clear-felled remaining stems.
     !nstems 0.01914413 0.01722971
      pause
      d fst_rem_th      !Fractions of stem numbers removed at each thinning.
      s fst_rem_th = 0.45, 0.4, 0.35, 0.3, 0.25, &
                     0.2,  0.15, 0.1, 0.0, 0.0, &
                     0.0, 0.0, 0.0, 0.0, 0.0
      d fbr_rem_th_prod, fst_rem_th_prod  !Fraction of branches, stems
                        !removed in thinning that go to products.
      s fbr_rem_th_prod = 0.1, fst_rem_th_prod = 0.8
      d fbr_rot_prod, fst_rot_prod  
         !Fraction of branches, stems at end of
         !rotation that go to products.
      s fbr_rot_prod = 0.5, fst_rot_prod = 0.8
      oc
      output t, year, nstems, &
         Onstems_th, kpulse_thin, s_thin, &
         kthin(1), tthin(1), fst_rem_th(1), &
         kthin(8), tthin(8), fst_rem_th(8), &
         maxt_D_tau_thin, nstart, &
         s_rotate, nstart, &
         maxt, arg1, tstop
   !Run for 1 year to initialize everything.
      rw
      s tstop = 365, cint = 1, nciout = 365; start

!      s tstop = 7300 !20 years.
      s cint = 365, nciout = 1, tstop = &tstop; start
      !Now maybe do grthinsitka of graphs, and prftlth_sit for printing
      !terminal (tl) data for thinsitka runs.
end !thinsitka.

! 121. 
proced grthinsitka !Graphs for thinsitka runs.  See "proced grya (" below
      d cint, nciprn
      plot/xaxis = year/xlo=0/xhi=60, nstems, onstems_th, &
                   Tair_inc, Tsoil_inc, CO2vpm, nstart
      d CO2vpm
      !Should be a constant, 350 is the default value.
      d cint, nciprn
      plot onstems_th, onstems_thya
end !grthinsitka.

! 122.
proced prftlth_sit !Print tl data for thinsitka runs.
      d nciprn, cint
      s nciprn = 1000000, cint = 5
      !default file is thinsitl.txt
      print/f = "thinsitl.txt", yeartl, yctl, Tairyatl, Tsoilyatl, &
         CO2vpmtl, Pca_av_yrtl, Pn_av_yrtl, Rtr_av_yrtl, &
         rPnPc_a_ytl, CStree_avtl, NStree_avtl, nstarttl
      s nciprn = 1, cint = 365 
      !Reset to previous value.
end !prftlth_sit.

! 123.
proced dprune !Display pruning parameters.
   d s_prune  !Pruning switch: on(1); off(0).
   !Fraction pruned year. Default fraction fpruneyr = 0.0 year-1.
   !Applied at a constant rate through the year:
      d fpruneyr, fpruneyr_chk 
   d k*prune, kst_prunez !Pruning rate constants.  
                         !Calculated from fpruneyr in Initial.
   !Fractions of the branches and stems removed which go to products:
      d fbr_prune_prod, fst_prune_prod
   !End of procedure dprune.
end !dprune.

! 124.
proced prune ( s_prune = 0, fpruneyr = 0.0 )
   !proced prune ( s_prune = 0, fpruneyr = 0.0 ) !Switch off/on pruning,
   !and set the fraction pruned per year.  At present is efm.csl, fpruneyr
   !is applied to branches (br) and to stem (st). 
   !Not to coarse roots (co) or fine roots (fi). Eg after switching on  
   !pruning with prune 1 0.5, and doing a start, d k??_prune.
   d s_prune
   s s_prune = &s_prune
   !Fraction pruned/thinned per year. Default fraction fpruneyr = 0.0 year-1.
   !Applied at a constant rate through the year:
      d fpruneyr
   !Fractions of the branches and stems removed which go to products:
      d fbr_prune_prod, fst_prune_prod  
   s fpruneyr = &fpruneyr
end !prune.

! 125.
proced selfthin ( s_selfthin = 1, allovr = 0 ) 
   d nstart
   !Display self-thinning parameters and turn on self-thinning.
   !Also turns off variable allometry.
   !selfthin 0 1 turns off selfthinning and turns on variable allometry.
   !Stem generation. Two options are provided, determined by s_seeds.
      !Default value of s_seeds = 0. Otherwise s_seeds = 1.
   !1. s_seeds = 0. Self-thinning is determined by tree variables, which
      !via FBRnstemstr, determines the fractional birth rate of nstems,
      !FBRnstems.  Search efm.csl for 'FBRnstems = ' and 'FBRnstemstrz = '.
      !The parameters of this self-thinning option are:
      !(a) Fractional 20 oC birth rate constant of stem numbers, kFBRnstems20, 
      !(b) minimum fraction to which 
          !germination is decreased due to light level on ground:
          d fgerm_light_min !See 'fgerm_light = '.  This factor also is in
          !option 2, when s_seeds = 1 via a state variable nseeds and seed
          !germination.             
      !Fractional 20 oC death rate of stem numbers, 
         !depends on LAI and CNtree:
         d kFDRnstems20, KLAIstdeath, KCNtreestdeath 
      !A dimensionless constant (default, 2) adjusts average stem XDM (MXst)
         !to a possibly higher value (if > 1) which may apply
         !more realistically to the death of stems (over-mature trees):
         d cDnstXst
   !2. If s_seeds = 1 this gives stem generation via a soil seed pool, nseeds.
         d ktree_seeds20, kseed_death20, qWgerm, kseed_germ20, &         
         fgerm_light_min , s_seeds
   !Turn on self-thinning:
      s s_selfthin = &s_selfthin 
   !Switch off variable stem height:diameter ratio:
      s allovr = &allovr
   !To turn off selfthinning and variable allometry on, "selfthin 0 1".

d nstart

end !selfthin. ( s_selfthin = 1, allovr = 0 ).

! 126.
proced goselfthintest (tstop = 730, cint = 365, nciout = 1)
   restore
   d s_selfthin, allovr, s_seeds
   selfthin; 
   !Turns on selfthinning (sn), via tree variables,
      !sets s_selfthin = 1, and allovr = 0, and, 
      !by default in efm.csl, s_seeds = 0. Uses tree variables for sn.
      d s_selfthin, allovr, s_seeds 
   oc
   output year, nstems, nseeds, &
          FBRnstems, FDRnstems, s_seeds, &
          LAI, CNtree, Mtree
   s cint = &cint, nciout = &nciout, tstop = &tstop
   start
end !goselfthintest.

! 127.
proced grnseeds !Graphs of nseeds, inputs and outputs.
   plot /xaxis = year, Onseeds_death, Onseeds_germ/same
   plot /xaxis = year, Itree_nseeds/tag = 'only 1 input to nseeds'
   plot /xaxis = year, Inseeds, Onseeds/same
   plot /xaxis = year, nseeds/tag='# seeds m-2', Dnseeds
end !grnseeds.


! 128.
proced thin4 !Thinning, with four thinnings over 5 years.
   !Switch on thinning:
      s s_thin = 1 
   !Set number of thinnings:
      s nthin = 4
   !Set thinning times at 1, 2, 3, 4 years:
      s tthin = 365, 730, 1095, &
                1460, 1.0e15, 1.0e15, &
                1.0e15, 1.0e15, 1.0e15, &
                1.0e15   !days.
   !Set thinning fractions (fractions of actual stems present removed at
      !each thinning:
      s fst_rem_th = 0.2, 0.25, 0.3333333333333333, &
         0.5, 0.0,  0.0, &
         0.0, 0.0, 0.0, &
         0.0  !Dimensionless.
   s nciout = 365, tstop = 1825 !5 years.
   oc !Output clear.
   output MXst, nstems, LAI, &
          DWtree, DWtreez1, DWtreez2, &
          DWtree_chk, IWtree, OWtree
end !thin4.

! 129. 
proced rotate (s_rotate = 1) !Switch on/off rotations (TERMINAL block)
      s s_rotate = &s_rotate
   !? Switch on thinning with 'thin', or off with thin 0'
   !Switch off with rotate 0
end !rotate.

! 130.
proced dthin !Display thinning parameters.
     d s_thin      !Thinning switch.
     d tthin       !Times when thinning occurs.
     d yrthin      !Years when thinning occurs.
     d fst_rem_th  !Fractions of stem numbers removed at each thinning.
     d kthin
   !?plot kthin_pulseya to check thinning, if appled.
end !dthin.

! 131. 
proced sk20  !Set rate constants to zero.  Can be useful for debugging.
   !Program may fail if all k20's are set to zero.
   !Tree.
   !s  Pmax20 = 0.0
   !s  sig_uN20 = 0.0  
   !s  roC20 = 0.9999e20
   !s  roN20 = 0.9999e20
   !s  kGle20 = 0.0     
   !s  kGbr20 = 0.0
   !s  kGst20 = 0.0
   !s  kGco20 = 0.0  
   !s  kGfi20 = 0.0
   !s  kmai_brA20 = 0.0
   !s  kmai_coA20 = 0.0
   !s  kmai_fi20 = 0.0
   !s  kmai_le20 = 0.0
   !s  kmai_stA20 = 0.0
   !s  kCSfi_ex20 = 0.0 
   !s  kNSfi_ex20 = 0.0
   !s  kXle_li20 = 0.0
   !s  kXbr_li20 = 0.0
   !s  kXst_li20 = 0.0
   !s  kXco_li20 = 0.0
   !s  kXfi_li20 = 0.0  
   !s  kSBRnst20 = 0.0
   !s  KSDRnst20 = 0.0
   !Soil and litter.
   s  ksurf_li_cel20 = 0.0
   s  ksurf_li_lig20 = 0.0
   s  ksurf_li_met20 = 0.0
   s  ksoil_li_cel20 = 0.0
   s  ksoil_li_lig20 = 0.0
   s  ksoil_li_met20 = 0.0 
   !s  kbioD20 = 0.0
   !s  kbioG20 = 0.0
   !s  kNfix_bio20 = 0.0
   !s  kCsolR20 = 0.0
   !s  kdenit20 = 0.0   
   !s  knit20 = 0.0
   !s  kvol20 = 0.0
   !s  kuSOM_min20 = 0.0
   !s  kuSOM_SSOM20 = 0.0 
   !s  kpSOM_min20 = 0.0
   !s  kpSOM_SSOM20 = 0.0
   !s  ksSOM_min20 = 0.0   
end !sk20.

! 132.
proced envpars !Environmental parameters, default and actual values.
   !These are the defaults in the program, for eskdalemuir, sinusoidal seasonal
      !and diurnal data. 
   !They are followed by the actual value, which may be different.  
   !Constants:
   d latitude_degc, latitude_deg
   d href
   d CO2vpmc, CO2vpm 
   d INenv_Namm_hayrc, INenv_Nnit_hayrc
   d INenv_Namm_hayr, INenv_Nnit_hayr

   d fclay_default, fclay
     
      pause !
   !Sinusoids:
   d jPARdymn, jPARdyvar, tjPAR ! These don't seem to be changed at all?
   d fbshrsmean_sin, fbshrsvar_sin, tfbshrs ! Nor these.
   d rainmn, rainvr, train  ! Nor these.
   d RHmaxmn, RHmaxvr, tRH  ! But yes for these, but there is no storage of
    !the default values.

   d RHminmn, RHminvr, tRH  ! ditto
   d windmaxmn, windmaxvr, twind ! ditto. Do e.g. d windm*. or twind*
   d Tairmaxmn, Tairmaxvr, tTair ! ditto
   d Tairminmn, Tairminvr, tTair ! ditto
   d Tsoilmn, Tsoilvr, tTsoil    ! ditto
end !envpars. 

! 133. 
proced envvars !Display environmental variables.
   d t
   d latitude_deg, href, CO2vpm
   d INenv_Namm_hayr, INenv_Nnit_hayr
   d fclay
   d jPARdy, jPARsc, fbshrs
   d rain, RH
   d wind
   d Tair, Tsoil
end !envvars.


! 134.
proced Hurley !Set conditions to Southern Britain (Hurley).
   !All the below are defaults in the program.
   s jPARdymn = 4.8e6, jPARdyvar = 4.1e6
      !tjPAR = 81 days.  Phase of the radiation sinusoid.
      !Radiation is maximum on 21 June.
   s fbshrsmean_sin = 0.30 fbshrsvar_sin = 0.14
                          !Fraction of possible bright sunshine hours.
   s latitude_degc = 51.54
   s rainmn = 0.00180822, rainvr = 0.00060174
   s train = 233  !Rain is maximum on 20 November.
   s RHmaxmn = 0.8, RHmaxvr = 0.1    
   s RHminmn = 0.7, RHminvr = 0.1 
   s tRH = 273  !Relative humidity is maximum on 30 December.
   s windmaxmn = 1.5, windmaxvr = 1    !m s-1.
   s windminmn = 0.5, windminvr = 0.4  !m s-1.
   s Tairmaxmn = 14, Tairmaxvr = 7
   s Tairminmn = 6.5, Tairminvr = 5.5
   s tTair = 115  !Max 25 July.
   s Tsoilmn = 10, Tsoilvr = 6
   s tTsoil = 116  !Max 26 July.
   s INenv_Namm_hayrc = 50  !50 kg N ha-1 year-1 deposition.
   s fclay_default = 0.2 !Clay fraction. Guess.
end  !Hurley.

! 135.
proced Eskdal  !Set conditions to Northern Britain (Eskdalemuir).
   s jPARdymn = 3.8e6, jPARdyvar = 3.3e6
      !tjPAR = 81 days.  Phase of the radiation sinusoid.
      !Radiation is maximum on 21 June.
   s fbshrsmean_sin = 0.26, fbshrsvar_sin = 0.10 !Fraction of possible
                                                 !bright sunshine hours.
   s latitude_degc = 55.27
   s rainmn = 0.00418356, rainvr = 0.00139
   s train = 174  !Rain is maximum on 22 September.
   s RHmaxmn = 0.84, RHmaxvr = 0.07
   s RHminmn = 0.75, RHminvr = 0.13
   s tRH = 240  !Relative humidity is maximum on 28 November.
!   s windc = 4 !m s-1.
   s windmaxmn = 6, windmaxvr = 1.5 !m s-1.
   s windminmn = 2, windminvr = 0.5  !m s-1.
   s Tairmaxmn = 11, Tairmaxvr = 7
   s Tairminmn = 4, Tairminvr = 5
   s tTair = 115  !Air temperature is maximum on 25 July.
   s Tsoilmn = 8.5, Tsoilvr = 6
   s tTsoil = 116  !Soil temperature is maximum on 26 July.
   s INenv_Namm_hayrc = 10  !10 kg N ha-1 year-1 deposition.
   s fclay_default = 0.3 !Clay fraction.
end  !Eskdal.

! 136.
proced svs !Display state variables.
      d idaymo, imonth, year
      d t
   !Tree submodel:
      d nseeds
      d dorm2, comp, budb, dorm1
      d Aleaf, Mbud
      pause
      d Aleaf1, Aleaf2, Aleaf3, Aleaf4
      d MCSle, MNSle, MNph, MXle
      d MCSbr, MXbrm, MNSbr, MXbr
      d MCSst, MCStorest, MXstm, MNSst, MXst
      d nstems, hstem, dstem, rhdstem
      d nseeds
      d MCSco, MXcom, MNSco, MXco
      d MXfi1, MXfi2, MXfi3, MXfi4
      d MCSfi, MXfim, MNSfi, MXfi
      d rort 
      pause  
   !Litter and soil submodel:
      d Cbio, Csol, &
        Csoil_li_met, Csoil_li_cel, Csoil_li_lig, &
        Csurf_li_met, Csurf_li_cel, Csurf_li_lig, &
        CpSOM, CsSOM, CuSOM, &
        Namm, Nnit, &
        Nsoil_li_met, Nsurf_li_met, &
        NpSOM, NsSOM, NuSOM, &
        Char
        pause
   !Water submodel:
      d Wle, Wfi, Wsoil, Wpt 
   !Products:
      d Cptd, Nptd, Wptd
      d Cprd, Nprd, Wprd
      d Cpt,   Npt,  Wpt
end  !svs.

! 137.
proced Dsvs  !Display derivatives of the state variables.
      d idaymo, imonth, year
      d t, maxt
   !Tree submodel:
      d treevr, Dnseeds
      d Ddorm2, Dcomp, Dbudb, Ddorm1, Dmorph
      d DAleaf, DMbud
      pause
      d DMCSle, DMNSle, DMNph, DMXle
      d DMCSbr, DMXbrm, DMNSbr, DMXbr
      d DMCSst, DMCStorest, DMXstm, DMNSst, DMXst
      d Dnstems
      d DMCSco, DMXcom, DMNSco, DMXco
      d DMCSfi, DMXfim, DMNSfi, DMXfi
      d Dhstem, Ddstem 
      pause
   !Litter and soil submodel:
      d d soilvr. DCbio, DCsol, &
        DCsoil_li_met, DCsoil_li_cel, DCsoil_li_lig, &
        DCsurf_li_met, DCsurf_li_cel, DCsurf_li_lig, &
        DCpSOM, DCsSOM, DCuSOM, &
        DNamm, DNnit, &
        DNsoil_li_met, DNsurf_li_met, &
        DNpSOM, DNsSOM, DNuSOM 
        pause
   !Water submodel:
      d watervr, s_water, DWle, DWfi, DWsoil, DWpt 
   !Products:
      d DCptd, DNptd, DWptd
      d DCprd, DNprd, DWprd
      d DCpt,  DNpt,  DWpt
end !Dsvs.

! 138.
proced Dmorphsvs !Display derivatives of morph (tree) state variables, 
      d idaymo, imonth, year
      d t, tstop, maxt, &
        treevr, s_decid
   !Tree submodel:
      d Dnseeds
      d Ddorm2, Dcomp, Dbudb, Ddorm1, Dmorph
      d dorm2, comp, budb, dorm1, morph
end !Dmorphsvs.

! 139. 
proced Dtreesvs !Display derivatives of tree state variables.
      d idaymo, imonth, year
      d t, tstop, maxt, &
        treevr, s_decid
   !Tree submodel:
      d Dnseeds
      d Ddorm2, Dcomp, Dbudb, Ddorm1, Dmorph
      d dorm2, comp, budb, dorm1, morph
      d DAleaf, DMbud
      pause
      d DMCSle, DMNSle, DMNph, DMXle
      d DMCSbr, DMXbrm, DMNSbr, DMXbr
      d DMCSst, DMCStorest, DMXstm, DMNSst, DMXst
      d Dnstems
      d DMCSco, DMXcom, DMNSco, DMXco
      d DMCSfi, DMXfim, DMNSfi, DMXfi
      d Dhstem, Ddstem 
      pause
end !Dtreesvs.

! 140.
proced Dsoilandlittersvs  !Display derivatives of soil and litter svs
   !state variables, Dsoilandlittersvs.
      d idaymo, imonth, year
      d t, maxt
   !Litter and soil submodel:
      d DCbio, DCsol, &
        DCsoil_li_met, DCsoil_li_cel, DCsoil_li_lig, &
        DCsurf_li_met, DCsurf_li_cel, DCsurf_li_lig, &
        DCpSOM, DCsSOM, DCuSOM, &
        DNamm, DNnit, &
        DNsoil_li_met, DNsurf_li_met, &
        DNpSOM, DNsSOM, DNuSOM 
end !Dsoilandlittersvs.

! 141.
proced Dwatersvs  !Display derivatives of water submodel state variables, 
      d idaymo, imonth, year
      d t, maxt
   !Water submodel:
      d DWle, DWfi, DWsoil, DWpt 
end !Dwatersvs.

! 142.
proced Dproductsvs !Display derivatives of product submodel state variables,
                   !Dproductsvs.
      d idaymo, imonth, year
      d t, maxt

    !Product submodel:
      d DCptd, DNptd, DWptd
      d DCprd, DNprd, DWprd
      d DCpt,  DNpt,  DWpt
end !Dproductsvs.

! 143.
proced svs0 !Display state variable initial values
   !Tree submodel:
      d nseeds0
      d dorm20, comp0, budb0, dorm10
      d Aleaf10, Aleaf20, Aleaf30, Aleaf40
      d Mbud0
      d MCSle0, MNSle0, MNph0, MXle0
      pause
      d MXle?0
      d MCSbr0, MXbrm0, MNSbr0, MXbr0
      d MCSst0, MCStorest0, MXstm0, MNSst0, MXst0
      d nstems0, hstem0, dstem0, rhdstem0
      d MCSco0, MXcom0, MNSco0, MXco0
      d MCSfi0, MXfim0, MNSfi0, MXfi0
      d mxfi?0
      d rort0
      pause  
   !Litter and soil submodel:
      d Cbio0, Char0, Csol0, &
        Csoil_li_met0, Csoil_li_cel0, Csoil_li_lig0, &
        Csurf_li_met0, Csurf_li_cel0, Csurf_li_lig0, &
        CpSOM0, CsSOM0, CuSOM0, &
        Namm0, Nnit0, &
        Nsoil_li_met0, Nsurf_li_met0, &
        NpSOM0, NsSOM0, NuSOM0
        pause
   !Water submodel:
      d Wle0, Wfi0, Wsoil0, Wpt0
   !Products:
      d Cptd0, Nptd0, Wptd0, &
        Cprd0, Nprd0, Wprd0, &
        Cpt0,   Npt0, Wpt0
end !svs0.

! 144.
proced le !Foliage property variables
   d Aleaf, Mbud
   d MCSle, MNSle, MNph, MNph, MXle
   d Wle, rWXle
   d psiOle, psiPle, psiGle, psile
end !le.

! 145.      
proced lef !Leaf (foliage) fluxes.
   d Ibud_Aleaf1, IAleaf1, OAleaf1_2, OAleaf1_sn, OAleaf1_prune
   d OAleaf1_2, OAleaf2_3, OAleaf2_sn, OAleaf2_prune
   d OAleaf2_3, OAleaf3_4, OAleaf3_sn, OAleaf3_prune
   d OAleaf3_4, OAleaf4_li, OAleaf4_sn, OAleaf4_prune
   d Ibud_Xle1
   d IXle1, OXle1_2, OXle1_mai, OXle1_sn, OXle1_prune
   d OXle1_2, OXle2_3, OXle2_mai, OXle2_sn, OXle2_prune
   d OXle2_3, OXle3_4, OXle3_mai, OXle3_sn, OXle3_prune
   d OXle3_4, OXle4_li, OXle4_mai, OXle4_sn, OXle4_prune
   d ICph_CSleda, ICXli_rec_CSle, ICbud_CSle, &
     OCSle_CSbr, OCSle_mai, OCSbr_bud, &
     OCSle_loading, OCSle_Nnit_red, OCSle_li, OCSle_sn, OCSle_prune
   d INSbr_NSle, INXli_rec_NSle, INph_NSle, INph_li_NSle &
     INmaiX_NSle, INbud_NSle
   d ONSbr_bud, ONSle_Nph, ONSle_atm_stem &
     ONSle_li, ONSle_sn, ONSle_prune
   d ONSle_Nph, INbud_Nph, &
     ONph_NSle, ONph_li0, ONph_sn, ONph_prune
   d IWbud_Wle
   d OWfi_le, OWle_atm, OWle_sn, OWle_prune
   d OWle_atm_gndda, OWle_rad_gndda, OWle_vdg_gndda
   d OAleaf1_lf, OAleaf2_lf, OAleaf3_lf, OAleaf4_lf
   d OMXle1_lf, OMXle2_lf, OMXle3_lf, OMXle4_lf
   d OMCSle_lf, OMNSle_lf, OMNph_lf
end !lef.

! 146. 
proced Pmax !Display components of Pmax
   d t, light_on, Nletot
   d Tair, CO2vpm, fWph
   d Pmax, Pmax20, fCO2_Pmax, fT_Pmax, fWph, fgstom_Pmax
   !For more, d *Pmax*
end !Pmax.

! 147. 
proced alpha !Display components of alpha, photosynthetic efficiency
   d Tair, CO2vpm, fWph
   d *alpha*
end !alpha.

! 148.
proced Pmax20c !Set photosynthetic N to 0. Use the constant value
               !of Pmax20 in Pmax20c
   s s_Pmax = 0                               !Switch. Make Pmax constant.
   s MNph0z = 0.0                             !kg photosynthetic N stem-1. 
   s kG_Nph20 = 0.0, kD_Nph20 = 0.0           !No synthesis or degradation.
end !Pmax20c.

! 149. 
proced Pmax20vr !Set photosynthetic N variable (usual default setting).
   s s_Pmax = 1                               !Switch. Make Pmax vary.
   s MNph0z = 0.02e-3                         !kg photosynthetic N stem-1. 
   s kG_Nph20 = 0.06, kD_Nph20 = 0.15         !No synthesis or degradation.
end !Pmax20vr.

! 150.
proced phenol !Phenological state
   d s_deciduous, s_leaf
   d dorm2, comp, budb, dorm1
   d Aleaf, Mbud, Mbud_0h
   d t, tbudb
end !phenol.

! 151. 
proced odid_didin  !Output of diurnal varying data. This is for when diurnal
   !data are supplied in the file diurnal.dat and diurnal data is switched on
   !with yyy check this out.
   s s_diurnal = 1 !Applies diurnally changing environmental data, internally
                   !generated.
   s s_diurnal_dat = 1 !Inputs diurnal data from file diurnal.dat.
   oc
   output t, year, 
      hour, idaymo, imonth, &
      iJulian, JulianDy_di1, JulianDy_di2, &
      t_di1, Tair_di1, wind_di1, &
      t_di2, Tair_di2, wind_di2, &
      t,     Tair,     wind, &
      year, year_calendar, year_di1, &
      year_calendar_di, year_di2, &
      iz_rw_di, yearbeg, zdi_t1t2 
   s tstop = 1825, cint = 1, nciout = 73
   go !? start
end !odid_didin.

! 152.
proced godiurnaldata !Examine diurnal data. This is suppled in the file 
   !diurnal.dat which contains 5 years of hourly data.
   d tstop, cint, nciout, nciprn, maxt, s_pcan, nstart, one128th 
   !The file containing the diurnal data can be renamed:
   d filenamedi  !eg. s filenamedi = 'di2dys.dat    '.
   oc;
   output t, tstop, Tsoil, &
          year, nyears_rw_di, year_cal_di, &
          filenamedi, s_diurnal_dat
   !Run for 1 year to initialize everything with default environment
   s tstop = 365, cint = 1, nciout = 73; start; plot Tair/xaxis = month_r
   s s_diurnal_dat = 1
   s tstop = 3650, cint = 1, nciout = 73 !tstop is 10 years.
   s nyears_rw_di = 5 !Rewind every 5 years.
   start
   plot/xaxis=year, Tsoil, Tair
end !godiurnaldata.

! 153.
proced odid !Output of diurnal varying data 
   oc  !See diurnal.dat for diurnal data input.
   output hour, idaymo, imonth, &
      iJulian, year, jPARsc, &
      Tair, Tsoil, rain, &
      RH   !Note Tsoil is diurnally constant.
end !odid.

! 154.
proced grdid !Graphs of diurnal data
   s xticpl = 1
   plot/xaxis = hour/xhi=24 jparsc
   plot fsun
   plot Tair
   plot RH
   plot wind !These are the 5 diurnally varying environmental variables.
   !Two diurnally constant environmental variables
   plot rain/lo=1/hi=10    !Diurnally falls at a constant rate.
   plot Tsoil/lo=-10/hi=15   !Diurnally constant
end !grdid.

! 155.
proced prfdid (f = did.txt, nciprn = 1) !Print to file diurnal data
   s nciprn = &nciprn
   s tcwprn = 1000
   print/f = 'f', t, hour, s_diurnal, s_diurnal_dat, jPARsc, Tair, wind, &
      RH, Tsoil, rain 
   s nciprn = 1
   s tcwprn = 80
end !prfdid.

! 156. 
proced godi2yrs ( tstop = 730 ) !Test diurnal data. Without rewind
   odid
   s cint = 1, nciout = 73, tstop = &tstop 
   diurnaldata 1 di2yrs.dat 
   start
end !godi2yrs.

! 157.
proced godi5yrs ( tstop = 1825 ) !Test diurnal data. Without rewind
   odid
   s cint = 1, nciout = 365, tstop = &tstop 
   diurnaldata 1 di5yrs.dat 
   start
end !godi5yrs.

! 158.
proced godi2yrsrw ( tstop = 1460, nyears_rw_di = 2 ) 
      !Test diurnal data with ReWind after 2 yrs
   odid 
   diurnaldata 1 di2yrs.dat !This must be before the next statement.
   s cint = 1, nciout = 365, tstop = &tstop, nyears_rw_di = &nyears_rw_di 
   start
end !godi2yrsrw.
   
! 159.
proced grdi !Graphs of diurnal environment quantities
      plot /xaxis = year, jPARsc_12h/hi=1000
      plot Tair
      plot Tsoil
      plot rain
      plot wind
      plot RH
end !grdi.

! 160.
proced gody10dys ( tstop = 365 ) !Test daily data over 10 days from zh FACE
   oded
   dailydata 1 dy10dys.dat 
   s cint = 1, nciout = 1, tstop = 1; start !To initialize.
   s cint = 1, nciout = 73, tstop = &tstop 
   start
end gody10dys.

! 161.
proced gody1yr ( tstop = 365 ) !Test daily data ??
   oded
   dailydata 1 dy5yrs.dat !Daily data zh Face over 5 yrs, large file.
   s cint = 1, nciout = 1, tstop = 1; start !To initialize.
   s cint = 1, nciout = 73, tstop = &tstop 
   start
end !gody1yr.
       
! 162.
proced preparsvs !Prepare state variables
      !Litter and soil submodel:
         prepar Cbio, Csol, &
            Csoil_li_met, Csoil_li_cel, Csoil_li_lig, &
            Csurf_li_met, Csurf_li_cel, Csurf_li_lig, &
            CpSOM, CsSOM, CuSOM, &
            Namm, Nnit, &
            Nsoil_li_met, Nsurf_li_met, &
            NpSOM, NsSOM, NuSOM

      !Tree submodel:
         prepar nseeds, dorm2, comp, budb, dorm1, &
            Aleaf1, Aleaf2, Aleaf3, Aleaf4, Mbud, &
            MCSle, MNSle, MNph, MNph, &
            MXle1, MXle2, MXle3, MXle4, &
            MCSbr, MXbrm, MNSbr, MXbr, &
            MCSst, MCStorest, MXstm, MNSst, MXst, &
            nstems, hstem, dstem, &
            MCSco, MXcom, MNSco, MXco, &
            MCSfi, MXfim, MNSfi, MXfi
      !Water submodel:
         prepar Wle, Wfi, Wsoil, Wpt
      !Products:
         prepar Cptd, Nptd, Wptd, &
            Cprd, Nprd, Wprd, Cpt, Npt, Wpt
end !preparsvs.

! 163.
proced preparDsvs !Prepare derivatives of the state variables
      !Litter and soil submodel:
         prepar DCbio, DCsol, &
            DCsoil_li_met, DCsoil_li_cel, DCsoil_li_lig, &
            DCsurf_li_met, DCsurf_li_cel, DCsurf_li_lig, &
            DCpSOM, DCsSOM, DCuSOM, &
            DNamm, DNnit, &
            DNsoil_li_met, DNsurf_li_met, &
            DNpSOM, DNsSOM, DNuSOM

      !Tree submodel:
         prepar Dnseeds, Ddorm2, Dcomp, Dcompz, Dbudb, Ddorm1, Dmorph, &
            DAleaf1, DAleaf2, DAleaf3, DAleaf4, DMbud, &
            DMCSle, DMNSle, DMNph, &
            DMXle1, DMXle2, DMXle3, DMXle4, &
            DMCSbr, DMXbrm, DMNSbr, DMXbr, &
            DMCSst, DMCStorest, DMXstm, DMNSst, DMXst, &
            Dnstems, Dhstem, Ddstem, &
            DMCSco, DMXcom, DMNSco, DMXco, &
            DMCSfi, DMXfim, DMNSfi, DMXfi
      !Water submodel:
         prepar DWle, DWfi, DWsoil, DWpt
      !Products:
         prepar DCpt, DNpt, &             !Non-decayed thinning products.
                DCptd, DNptd, DWptd, &    !Decayed thinning products.
                DCprd, DNprd, DWprd       !Decayed rotation products.
end !preparDsvs.

! 164.
proced r12h !Run for 12 h from t = 0 d
   s cint = 0.125, nciout = 1, tstop = 0.5 
   rw
   start 
end !r12h.
       
! 165.
proced r1dy !Run for one day from t = 0 d
   s cint = 0.25, nciout = 1, tstop = 1 
   rw
   start 
end !r1dy.

! 166.
proced odi !Output some diurnal quantities
   oc
   output t, jPARsc, gstom, &
          light_on, Pcan, OWle
end !odi.

! 167.
proced r2dys !Run for two days with cint = 0.5, nciout = 1
   s cint = 0.5, nciout = 1, tstop = 2 
   start  
end !r2dys.

! 168.
proced r5dys !Run for five days, cint = 1
   s cint = 1, nciout = 1, tstop = 5 
   start 
end !r5dys.

! 169.
proced r10dys !Run for 10 days, cint = 1, nciout = 2
   s cint = 1, tstop = 10, nciout = 2
   start 
end r10dys.

! 170.
proced r20dys !Run for 20 days
   s cint = 1, tstop = 20, nciout = 2
   start 
end !r20dys.

! 171.
proced r60dys !Run for 60 days
   s cint = 1, tstop = 60, nciout = 5
   start 
end !r60dys.

! 172.
proced r100dys !Run for 100 days
   s cint = 1, tstop = 100, nciout = 10
   start 
end !r100dys.
   
! 173.
proced r1yr (cint = 0.125, nciout = 584) !Run for 1 year, 584 = 8 * 73
   s cint = &cint, tstop = 365, nciout = &nciout !584 = 8 x 73.
   start
   s xticpl = 1 !Was 1.2.
!   plot/xaxis = month_r/xhi=12, jparsc, runno
end !r1yr.

! 174.
proced r2yrs !Run for 2 years
   s cint = 1, tstop = 730, nciout = 73
   start 
end !r2yrs.


! 175. 
proced r3yrs !Run for 3 years
   s cint = 1, nciout = 365, tstop = 1095
   start
end !r3yrs.

! 176. 
proced r4yrs !Run for 4 years
   s cint = 1, nciout = 365, tstop = 1460
   start
end !r4yrs.

! 177.
proced r5yrs !Run for 5 years
   s cint = 1, tstop = 1825, nciout = 365, nciprn = 365
   start 
end !r5yrs.

! 178.
proced r8yrs !Run for 8 years
   s cint = 1, tstop = 2920, nciout = 365, nciprn = 365
   start 
end !r8yrs.

! 179.
proced r10yrs !Run for 10 years
   s cint = 1, tstop = 3650, nciout = 365, nciprn = 365
   start 
end !r10yrs.

! 180a.
proced r15yrs !Run for 15 years
   s cint = 1, nciout = 365, tstop = 5475, nciprn = 365
   start 
end !r15yrs.

! 180.
proced r20yrs !Run for 20 years
   s cint = 1, nciout = 365, tstop = 7300, nciprn = 365
   start 
end !r20yrs.

! 181.
proced r21yrs !Run for 21 years
   s cint = 365, tstop = 7665, nciout = 1
   start 
end !r21yrs.

! 182.
proced r50yrs !Run for 50 years
   s cint = 365, tstop = 18250, nciout = 5
   start 
end !r50yrs.

! 183.
proced r60yrs !Run for 60 years
   s cint = 365, tstop = 21900, nciout = 1
   start 
end !r60yrs.

! 184.
proced r100yrs !Run for 100 years
   s cint = 365, tstop = 36500, nciout = 20
   start 
end !r100yrs.

! 185.
proced r200yrs !Run for 200 years
   s cint = 365, tstop = 73000, nciout = 50
   start 
end !r200yrs.

! 186.
proced r500yrs !Run for 500 years
   s cint = 365, tstop = 182500, nciout = 100
   start 
end !r500yrs.

! 187. 
proced r1000yrs !Run for 1000 years
   s cint = 365, tstop = 365000, nciout = 200
   start 
end !r1000yrs.

! 188.
proced gr1d (xlo = 0, xhi = 1)  !Time t in days is abscissa, x
   plot /xaxis = t, /xlo = &xlo/xhi = &xhi, LAI
end !gr1d.

! 189.
proced settitle !Set title from 41 onwards to blanks
   s title = 480 * ' '
   s title = 'Plantation growth, 60-yr plots.'
end !settitle.

! 190.
proced gryrs !Plot graphs with year as the abscissa
   plot /xaxis = year, LAI
end !gryrs.

! 191.
proced grya (xhi = 60) !General-purpose yearly-average graphs for a 
   !60-year rotation, or do grya 90 for beech
   s xticpl = 0.5, xincpl = 6   !sitka
   s xticpl = 0.3, xincpl = 5.4 !beech
   settitle
   s title(41) = 'Carbon dioxide concentration.'
   s title(81) = 'Air temperature'
   s title(121) = 'Soil temperature'
   plot /xaxis = year, /xlo = 0 /xhi = &xhi, &
        CO2vpm, Tairya/hi=20, Tsoilya/hi=20
      pause

   settitle
   s title(41) = 'N deposition: kg N/ha/year'
   s title(81) = 'Number of stems/m2'
   plot INenv_dep_hayr, nstems
      pause

   settitle
   s title(41) = 'Bud mass, Mbud kg bud DM stem-1,'
   s title(81) = 'Mbud_gnd, kg bud DM m-2'
   plot /xaxis = year, /xlo = 0 /xhi = &xhi, &
      Mbud, Mbud_gnd
      pause

   settitle
   s title(41) = 'Julian dates of budburst,'
   s title(81) = 'onset of dormancy,'
   s title(121) = 'end of dormancy.'
   s yincpl = 6, yticpl = 0.5
   plot jdorm2/lo=0/hi=365, jdorm1, jbudb/same
   s yincpl = 5, yticpl = 1
      pause

   settitle
   s title(41) = 'Leaf area index'
   s title(81) = 'Specific leaf area: m2/kg DM'
   plot /xaxis = year, /xlo = 0 /xhi = &xhi, &
      LAI_1Aug15h, SLA_1Aug15h
      pause

   settitle
   s title(41) = 'Stem structural DM, kg/stem'
   s title(81) = 'Mean stem volume growth rate:'
   s title(121) = 'm3/ha/year'
   plot MXst, Vptr_hayr
      pause

   settitle
   s title(41) = 'Structural DM of foliage (le),'
   s title(81) = 'branches (br), coarse roots (co),'
   s title(121) = 'fine roots (fi)'
   plot MXbr, MXle_1Aug15h, MXco, MXfi/same
      pause

   settitle
   s title(41) = 'Gross, net canopy photosynthesis,'
   s title(81) = 'C flux, tree to soil (litter + '
   s title(121) = 'exudate). All are kg C/m2/year'
   plot Pcanya/hi=1, Pnetya/hi=1, OCtree_soilya/hi=1/same
      pause

   settitle
   s title(41) = 'Pmax at 20 C of light response eqn'
   s title(81) = 'Pmax at 15h, 1 Jul.  kg C/m2/s'
   s title(121) = 'Stomatal cond 15h, 1 Jul. m/s'
   plot Pmax20ya, Pmax_1Jul15h/same, gstom_1jul15h
      pause

   settitle
   s title(41) = '1 Aug, 15h: Pmax20fCO2 at 20 C of light'
   s title(81) = 'response eqn. kg C/m2/s'
   s title(121) = 'photosynthetic N, kg N m-2.'
   plot Pmax20fCO2_1Aug15h, Nph_A_1Aug15h
      pause

   settitle
   s title(41) = 'Ratio, net to gross photosynthesis'
   plot rPnet_Pcanya, /lo=0, /hi=1
      pause

   settitle
   s title(41) = 'Ratio, gross photosynthesis to LAI'
   plot rPcanLAIya, /lo=0, /hi=1
      pause

   settitle
   s title(41) = 'Tree maintenance, growth'
   s title(81) = 'respirations. kg C/m2/year'
   plot Rmai_tree_gndya, RGtree_gndya, /same
      pause


   settitle
   s title(41) = 'N concs in leaf:'
   s title(81) = 'total, substrate, structural, photosynthetic,'
   s title(121) = 'kg N/kg structural DM'
   plot Nletot_Xya, Nleya, NXleya, Nphya/same
      pause

   settitle
   s title(41) = 'Leaf total N concn per unit area'
   s title(81) = 'kg N/m2'
   plot Nletot_Aya
      pause

   settitle
   s title(41) = 'Carbon substrate concentrations,'
   s title(81) = 'leaf, branches, stem, coarse, fine roots'
   s title(121) = 'kg C substrate/kg structural DM'
   plot Cleya, Cbrya, Cstya, Ccoya, Cfiya/same
      pause

   settitle
   s title(41) = 'Nitrogen substrate concentrations,'
   s title(81) = 'fine, coarse roots, stem, branches, leaf'
   s title(121) = 'kg N substrate/kg structural DM'
   plot Nfiya, /hi=.1, Ncoya, Nstya, Nbrya, Nleya/same
      pause

   settitle
   s title(41) = 'C x N substrate product,'
   s title(81) = 'fine, coarse roots, stem, branches, leaf'
   s title(121) = 'kg C substrate x kg N substrate'
   s title(161) = '(kg structural DM)^2'
   plot CNleya, CNbrya, CNstya, CNcoya, CNfiya/same
      pause

   settitle
   s title(41) = 'Incremental height:diameter growth ratio'
   s title(81) = 'over a year'
   s title(121) = 'height:diameter ratio, stem height (m)'
   plot rDhDdstemya, rhdstem/same, hstem
      pause

   settitle
   s title(41) = 'Soil mineral N, ammonium N'
   s title(81) = 'nitrate N'
   s title(121) = 'kg N/m2'
   plot Nminya/hi=.001, Nammya, Nnitya/same
      pause

   settitle
   s title(41) = '15h 1 Jul water potentials'
   s title(81) = 'foliage (le), fine roots, soil'
   s title(121) = 'J/kg water (equiv 1000 Pa)'
   plot psile_1jul15h/hi=0, psifi_1jul15h, psisoil_1jul15h /same
      pause

   settitle
   s title(41) = '15h 1 Jul within-plant'
   s title(81) = 'resistances to water transport'
   s title(121) = '[J (kg water)-1] day (kg water stem-1)-1.'
   plot rWle_1Jul15h, rWst_1Jul15h, rWfi_1Jul15h
      pause

   settitle
   s title(41) = 'Carbon substrate (CS) concn in tree'
   s title(81) = 'kg CS (kg structural DM)-1.'
   plot CStreeya
      pause

   settitle
   s title(41) = 'Fraction by which maintenance'
   s title(81) = 'respiration is decreased by'
   s title(121) = 'substrate limitation.'
   plot fCSmai_treeya
      pause

   settitle
   s title(41) = 'Soil hydraulic conductivity'
   s title(81) = 'kg m-3 (s/d) s. See efm.csl'
   plot gsoilW_1jul15h /LOG
      pause

   settitle
   s title(41) = 'Resistances, soil to fine root surface,'
   s title(81) = 'fine root surface to roots. 15 h, 1 Jul'
   s title(121) = 'm4 kg-1 (d/s) s-1'
   plot rWso_fisurf_1jul15h, /LOG, rWfisurf_fi_1jul15h /same
      pause

   settitle
   s title(41) = 'Resistances, soil to fine roots,'
   s title(81) = 'stem resistance (between roots and foliage)'
   s title(121) = 'm4 kg-1 (d/s) s-1'
   plot rWso_fi_1jul15h /LOG, rWfi_st_le_gnd_1jul15h /same
      pause

   settitle
   s title(41) = 'Water fluxes (kg water/m2/day)'
   s title(81) = 'roots to foliage,'
   s title(121) = 'soil to roots, 15 h, 1 Jul'
   plot OWfi_Wle_gnd_1jul15h, OWso_fi_1jul15h /same
      pause

   settitle
   s title(41) = 'Relative water contents: foliage, soil'
   s title(81) = 'stomatal conductance (m/s)'
   s title(121) = '15 h, 1 Jul'
   plot thetale_1Jul15h, /lo=0/hi=1, thetasoil_1Jul15h, /same, gstom_1Jul15h
      pause

   settitle
   s title(41) = 'Leaf water potential: total, osmotic'
   s title(81) = 'pressure, gravitational'
   s title(121) = 'J/kg water, equiv 1000 Pa'
   plot psile_1jul15h /lo=-2500/hi=2500, psiOle_1jul15h, psiPle_1jul15h, &
        psiGle_1jul15h/same
      pause

   settitle
   s title(41) = 'Water flux from leaves, total,'
   s title(81) = 'radiation, vapour density gradient components'
   s title(121) = 'kg water/m2/year'
   plot OWle_atm_gndya, OWle_rad_gndya, OWle_vdg_gndya /same
      pause

   settitle
   s title(41) = 'Rain, intercepted and evaporated cpt,'
   s title(81) = 'transpired component, drainage'
   s title(121) = 'kg water/m2/year'
   plot rainya, OWrain_intya, OWle_atm_gndya, OWso_drainya /same
      pause

   settitle
   s title(41) = 'N losses: from foliage, volat, nitrif,'
   s title(81) = 'leaching, denitrif'
   s title(121) = 'kg N/m2/year'
   plot ONSle_atm_gndya/hi=10.0e-4, ONamm_volya, ONamm_nitrif_envya, &
      ONnit_lchya, ONnit_denitya, /same
      pause

   settitle
   s title(41) = 'Carbon leaching loss'
   s title(81) = 'kg C/m2/year'
   plot OCsol_lchya
      pause

   settitle
   s title(41) = 'C pools: system, tree, soil,'
   s title(81) = 'soil SOM, products'
   s title(121) = 'kg C/m2'
   plot Csys/lo = 0, Ctree, Csoil, CSOM, Cptrd/same
      pause

   settitle
   s title(41) = 'N pools: system, tree, soil,'
   s title(81) = 'soil SOM, products'
   s title(121) = 'kg N/m2'
   plot Nsys/lo = 0, Ntree, Nsoil, NSOM, Nptrd/same

   settitle
   s title(41) = 'Thinning product pools (d = decaying).'
   s title(81) = 'Cpt, Cptd'
   s title(121) = 'kg C/m2'
   plot Cpt, Cptd/same

   settitle
   s title(41) = 'Rotation product pools.'
   s title(81) = 'Cpr, Cprd'
   s title(121) = 'kg C/m2'
   plot Cpr, Cprd/same

   settitle
   s title(41) = 'Thinning + rotation product pools.'
   s title(81) = 'Cptr, Cptrd'
   s title(121) = 'kg C/m2'
   plot Cptr, Cptrd/same

   s xticpl = 1.2
end !grya. end of ! 191.

! 192.
proced grW (xhi = 60) !Items relevant to water
   s xticpl = 1, xincpl = 6
   plot /xaxis = year, /xlo = 0 /xhi = &xhi, &
      thetasoil_1Jul15h, psisoil_1jul15h 
   plot psile_1jul15h/hi=0, psifi_1jul15h, psisoil_1jul15h /same
      pause
   plot gsoilW_1jul15h /LOG;  pause
   plot rWso_fisurf_1jul15h, /LOG, rWfisurf_fi_1jul15h /same; pause
   plot rWso_fi_1jul15h /LOG, rWst_gnd_1jul15h /same;  pause
   plot OWfi_le_gnd_1jul15h, OWso_fi_1jul15h /same;   pause
   plot psile_1jul15h /lo=-2500/hi=2500, psiOle_1jul15h, psiPle_1jul15h, &
        psiGle_1jul15h/same; pause
   plot thetale_1Jul15h, /lo=0/hi=1, thetasoil_1Jul15h, /same, gstom_1Jul15h
      pause
   plot Pcanya, Pmax20ya, Pmax_1Jul15h, gstom_1jul15h; pause
      pause
   plot Cleya, Nleya
      pause
   plot OWle_atm_gndya, OWle_rad_gndya, OWle_vdg_gndya /same
      pause
   plot rainya, OWrain_intya, OWle_atm_gndya, OWso_drainya /same
      pause
end !grW. ! 192.

! 193.
proced grCsol !plots of items relevant to soluble C in soil 
   plot ICsol, OCsol, Csol
   plot ICsurf_li_Csol , ICsoil_li_Csol , &
      ICfi_Csol 
   plot ICbioD_Csol , ICuSOM_Csol , &
      ICpSOM_Csol , ICsSOM_Csol
   plot OCsol_bioG , OCsol_lch , OCsolR
end !grCsol.

! 194.
proced oW !Output water variables
   output/clear
   output t, idaymo, imonth, &
      iJulian, year, LAIya, &
      Pcanya, Vptr_hayr, Nminya, &
      gstom_1jul15h, Wle, &
      MXle, Cle, Nle, &
      psisoil, psifi, psile, &
      psisoil_1jul15h, psifi_1jul15h, psile_1jul15h, &
      rWfi_1jul15h, rWst_1jul15h, rWle_1jul15h, &
      rWfi_st_le, rMSleWle, rWXle, &
      psile, psiOle, psiPle, &
      psiGle, s_leaf, budburst, &
      psile_15h, budb, budburstya, &
      dorm1, nstems, leaf_fall, &
      dormant, budsopening, leaf_fallya, &
      dormantya, budsopeningya, &
      s_leaf, s_leafya, MXst
end !oW. 

! 195.
proced oSLA !Output SLA variables
   oc !output clear.
   output t, year, SLA, &
      Aleaf, Mle, SLAmax, &
      fSLA_C, fSLA_W, cSLA_C, &
      Cle, cSLA_W, thetale, &
      SLAya
end !oSLA.

! 196.
proced twiddle !Parameter twiddling. ugh

   !Specific leaf area parameters:
      d SLAmax, cSLA_C, cSLA_W

   !Litter rate constants (note fT(10 C) = 0.35):
      d kX??_li20  !Basic parameters (high light).
      !Half-life at 10 C = 0.69 / (0.35 * k * 365) years.
      pause
   !Light-dependent senescence parameters:
      d s_light_KXle_li  !Switch for light-dependend senescence rates.
      d kjPAR_rav20, jPAR_rav0
      d  m_kXle_li_max, KjPAR_kXle_li
   !Photosynthetic N parameters:
      d kG_Nph20, KNSle_Nph, KjPAR_Nph, cPmax_Nph, kD_Nph20
   !Growth parameters:
      d kG*20
      pause

   !Yield of growth process:
      d YG*
   !Maintenance parameters:
      d kmai20, KCmai
      ! "d *mai" for lots more maintenance parameters and variables. 
      pause
   !Potential meristem size parameters:
      d cpot??m  !Defaults are all 100.
   !Allometric parameters:
      d qA*
   !Transport resistivity parameters:
      d roC20, roN20
      d roW??20
      d qroC, qroN
      d qroW??
      pause

   !Root uptake constants:
      d kuN20
   !N content of structural compartments:
      d fN??X
   !Water relations parameters:
      d cpsiPr, epsilon, fSos_ac, rmm_osm !Defaults: 0.2, 2e6, 2, 20
      pause

   !N gain (fixation) and soil loss parameters:
      d kNfix_bio20, kvol20, knit20, fnitrif, kdenit20, thetasoil_max
   !N loss through stomata:
      d Namm_atm_vpb, cNamm_le_NSle20

   d maxt
   d sctreeic

   !This list (program defaults) runs ok for 60 y, Eskdalemuir, 
      !standard thinning, equilibrium.
   !YC = 6.8, Nminav = 0.3e-3, LAI (final) = 2.7
   !Considerable stomatal closure.

   !1.
!    s roC20 = 0.1  !was 0.01.
      !YC = 11.9, Nminav = 0.3e-3, LAI (final) = 2.17
      !No stomatal closure. Very high del CS between le and fi.
   !2. also
!    s roN20 = 1    !was 5.
      !YC = 10.5, Nminav = 0.15e-3, LAI (final) = 7.1
      !Plenty of stomatal closure.
   !3.
!    s roN20 = 2 !from 1.
      !YC = 11.1, Nminav = 0.18e-3, LAI (final) = 6.3

   !Further changes are numbered so we can get back.
end !twiddle ! 196.

! 197.
proced Nfix !Nfixation parameters and variables
   d INfix_Namm, INfix_Nammya, INfix_Namm_av_yr
   d kNfix_bio, kNfix_bio20, fTsoil, fWsoil
   d Cbio, KCsol_Nfix, Csol
   d Neff_bio, JNeff_bio_Nfix
   d fSOMbio, CSOM
end !Nfix.

! 198.
proced otest !output list, of unknown origin
   oc
   output t, LAI, gstom_15h, &
          MXfi, Pcanda, Pcanyb, &
          jPARscda
end !otest.

! 199.
proced othin !Output for thinning (evergreen)
   oc
   output year, nstart, Mtree, &
          LAI, gs_1jul15h, Nmin, &
          nstems, Pcanya, Vptr_hayr
end !othin.

! 200.
proced othinb !Output for thinning (deciduous)
   oc
   output year, Tair, jPARscda, &
          LAI_1Aug15h, gs_1Aug15h, Nmin, &
          MXfi, Pcanya, Vptr_hayr, &
          NsSOM0, NsSOM, nstems
end !othinb.

! 201.
proced surf_li !Surface litter, examine fluxes at t = 0
   oc
   go 0 
   d DCsurf_li, t, DNsurf_li
   d DCsurf_li_chk, DNsurf_li_chk
   d INsurf_li
   d INsurf_li_met, INsurf_li_cel, INsurf_li_lig
   d ONsurf_li
   d ONsurf_li_met, ONsurf_li_cel, ONsurf_li_lig
   d DNsurf_li
   d DNsurf_li_met, DNsurf_li_cel, DNsurf_li_lig
   d INsurf_li, INsurf_li_chk
end !surf_li. ! 201.

! 202.
proced OCSfi !display outputs of C substrate fine roots pool
   d OCSfi, OCSfi_mai, OCSfi_G, RNmin_upt, OCSfi_Nnit_red, OCSfi_min_upt, &
     OCSfi_li, OCSfi_ex, OCSfi_sn, &
     OCSfi_prune, OCSfi_fire
end !OCSfi.
  
! 203.
proced cf3env !Compare 3 environments over 12 months
     oc;  s runno = 0
     output runno, t, RHmax, &
     hour, idaymo, imonth, &
     s_months12_dat, s_clino_dat, &
     s_monthsnn_dat, &
     filenamem12, filenameCLINO, filenamemnn, &
     fsun_12h, latitude_deg, LAI, Pcanya
   s tstop = 365, cint = 0.25, nciout = 1460 292 != 5 * 4 * 73; 
   start; !initialize everything.

   s runno = 1
   !run 1, sunusoidal eskdale env.
   start;    nrw

   s runno = 2
   !Run 2. Eskdale monthly env.
   s s_months12_dat = 1        !Read monthly data.
   s filenamem12 = blank20 !Clear filenamem12, a 20 character array.
   s filenamem12 = "eskdale.dat" !Read Eskdale monthly data.
   start; 
   s s_months12_dat = 0

   s runno = 3
   !Run 3. CLINO monthly envt.
   s s_clino_dat = 1  !Reads in the monthly data file clino.dat
   s filenameCLINO = blank20 
   !Clear filenameCLINO, a 20 character array.
   s filenameclino = "sault.dat" !Read Sault Ste Marie, Ontario monthly data.
   start;
   !do a "grded" to graph daily data. godiurnal for diurnal data.
end !cf3env. ! 203. 

! 204. 
proced s_diurnal ( s_diurnal = 1 ) !Examine results, diurnal switch on/off   
! Abbreviate s_diurnal with s_di. !rewind (rw) ?
   oc; pc !Clear output and prepar lists.
   output hour, idaymo, imonth, &
          jPARsc, fsun, fbshrs, Tair, RH, vpd, wind, rain, tdawn, &
          daylength, tdawnhr, tduskhr, daylengthhr, s_diurnal

   prepar hour, t, month_r, iJulian, idaymo, imonth, &
          solar_dec_deg, &
          latitude_deg, arg_daylength, acos_arg_daylength, &
          daylength, daylengthhr, tdawnhr, solar_elevation_deg, &
          tdawn1, tdawn, &
          solar_elevation_noon_deg, &
          hour_angle, hour_angledeg, &         
          hourangle_dawn_deg, cos_solar_azimuth_dawn, solar_azimuth_dawn
   prepar jPARdy, jPARdye_6, fbshrs, light_on, &
          Tairmax, Tairmin, Tsoil, &
          windmax, windmin, rain, RHmax, RHmin
   prepar jPARsc, jNetRsc, fsun, fbshrs, &
              Tair, RH, vpd, roWvap_atm, roWvap_atme3, wind
   prepar gstom, Pcan, OWle_atm 
   prepar *_12h !Noon quantities.
   prepar zero
   
   s tic = 100
   s tstop = 1, cint = maxt, nciout = 16
   s s_diurnal = 1
   s tstop = 101, cint = maxt, nciout = 16; 
   rw; start; start; 
   nrw
 !  s s_diurnal = 0; start
   !s_diprf s_di.txt
!   d jPARscda, jPARdy, jPARdy_yday
 !  d daylength, daylength_yday 
   d nstart !should be 3 or maybe 2
   !grs_diurnal for graphs?
end !s_diurnal. ! 204.

! 205.
proced grs_diurnal !Graphs from s_diurnal
   s xincpl = 6, xticpl = 0.75
   s yincpl = 5, yticpl = 0.5
   plot /xaxis = hour/xhi=24, jPARsc/tag='W PAR m-2 s-1'
   plot fsun/lo=0/hi=1
!   plot fbshrs/lo=0/hi=1
   plot solar_elevation_deg/lo=-50/hi=50
   plot light_on/lo=-1/hi=4 
   plot Tair/tag = 'deg C'
   plot RH
   plot vpd/tag = 'Pa'
   plot wind/tag = 'm s-1'
   plot roWvap_atm/lo=0.004/hi=0.0065/tag = 'kg water m-3'
!   plot roWvap_atme3/tag = 'g water m-3'
!   plot gstom/lo=0/hi=.01, 
!   plot Pcan/lo=0/hi=10.0e-6/tag = 'kg C m-2 ground d-1'
!   plot OWle_atm/lo=0/hi=0.01/tag = 'kg water stem-1 d-1'
end !grs_diurnal.

! 206.
proced s_diprf (f = s_diurnal.txt) !Print to file
   print/f = '&f' hour, idaymo, imonth, &
              jPARsc, jNetRsc, fsun, fbshrs, &
              Tair, RH, vpd, roWvap_atme3, wind, rain, &
              solar_elevation_deg, light_on
end !s_diprf.
 
! 207.
proced gomnn (filenamemnn ="monthsnn.dat") !Not tested
   !For inputtimg monthly data fron a GCM-generated file. eg. 
   !file monthsnn.dat by default. Or eg
       !s filenamemnn = "gramp2yr.mon"
     oc;  s runno = 0
     output runno, t, year, &
     hour, idaymo, imonth, &
     s_months12_dat, s_clino_dat, &
     s_monthsnn_dat, &
     filenamem12, filenameCLINO, filenamemnn, &
     fsun_12h, latitude_deg, LAI, Pcanya
   s tstop = 7300, cint = 0.25, nciout = 1460 ! 1460 = 5 * 4 * 73; 
!   s filenamemnn = "gramp2yr.dat"
!   s filenamemnn = "gramp3yr.dat"
   s filenamemnn = "grampian.dat"
   s s_monthsnn_dat = 1
   start; !initialize everything.
   start
   d latitude_deg_mnn, filenamemnn, fclay_mnn
   gryr
end !gomnn. ! 207.
 
! 208.
proced goCO2cc ( tstop = 3650 ) !Examine C02 under climate change
     oc;  s runno = 0
     output runno, t, year, &
     s_clino_dat, LAI, Pcanya, &
     CO2vpm, co2air, nyrsofcd, &
     s_co2cc, filenamecd, tstop

   s tstop = 365, cint = 1, nciout = 365 !
   start; !initialize everything.
   s tstop = &tstop
   s runno = 1
   s s_co2cc = 0 !Switch off 
   start
   nrw
   s s_co2cc = 1 !Switch on co2vpm increase.
   s runno = 2
   start 
   plot/xaxis=year, co2vpm
   !Also plot co2vpm, co2air, lai, pcanya, rshrt, rlefi separately
   !Blue is no co2 increase, green is increase in CO2.
end !goco2cc.
 
! 208a.
proced goTcc ( tstop = 3650 ) !Examine T(emperature) under climate change
     oc;  s runno = 0
     output runno, t, year, &
     s_clino_dat, LAI, Pcanya, &
     Tair, Tsoil, nyrsofcd, &
     s_Tcc, filenamecd, tstop

   s tstop = 365, cint = 1, nciout = 365 !
   start; !initialize everything.
   s tstop = &tstop
   s runno = 1
   s s_Tcc = 0 !Switch off 
   start
   nrw
   s s_Tcc = 1 !Switch on temparature increase.
   s runno = 2
   start 
   plot/xaxis=year, Tair
   !Also plot Tsoil, co2vpm, co2air, lai, pcanya, rshrt, rlefi separately
   !Blue is no temp increase, green is increase in Tair.
end !goTcc.

! 209.
proced gowindcc ( tstop = 3650 ) !Examine wind increase under climate change
     oc;  s runno = 0
     output runno, t, year, &
     s_co2cc, s_Tcc, s_windcc, &
     *inc_yr, &
     *inc_cc, &
     CO2vpm, Tair, Tsoil, &
     wind, windinc_cc, winddymn, windmax, windmin
   s tstop = 365, cint = 1, nciout = 365 !
   start; !initialize everything.
   s tstop = &tstop
   s runno = 1
   s s_windcc = 0 !Switch off wind increase due to climate change.
   start
   nrw
   s s_windcc = 1 !Switch on wind increase
   s runno = 2
   start 
   plot/xaxis=year, wind
   !Also plot co2vpm, co2air, lai, pcanya, rshrt, rlefi separately
   !Blue is no wind increase, green is with increase.

end !gowindcc.

! 210.
proced monthsnndata (s_monthsnn_dat = 1, filenamemnn = monthsnn.dat)
   !Monthly environmental data over many months. month by month
   !See file: monthsnn.cmd

   !Reeet all data input switches to 0 so just the default occurs.
      s s_diurnal_dat = 0, s_daily_dat = 0.0, s_months12_dat = 0, 
      s s_CLINO_dat = 0, s_cd = 0
   !Now set the paramaters for the monthsnn input:
      s s_monthsnn_dat = &s_monthsnn_dat
      s filenamemnn = 20*' '  !Clear character array.
      s filenamemnn = '&filenamemnn' !eg gramp2yr.mon

   !For daily data out s s_dy_dat_out = 1, default 0, to file dailyout.dat
   !Care: daily data files can be huge.
   !Display switches and parameters
      d s_diurnal_dat, s_daily_dat, s_months12_dat, s_CLINO_dat
      d s_monthsnn_dat
      d filenamemnn, s_cd, s_dy_dat_out
      d tstop, cint, nciout  !3 x 365 = 1095 

   oc; 
   output t, iJulian, idaymo, &
          tstop, rainda, nstart, & 
          year, imonth, hour, &
          yrstop, filenamemnn, & 
          iyear_mon1, latitude_deg, &
          iyear_mon2, imonth_mon2, &
          s_deciduous, LAI, maxt, & 
          s_monthsnn_dat, psifi, psi?fi, psisoil, thetasoil, &
          treevr, soilvr, watervr, s_water, morph, dorm1, dorm2, budb, &     
          Dmorph, Ddorm1, Ddorm2, Dbudb
          
   !s tstop = 109500 !Equiv to 300 years
   !s cint = 1, nciout = 365, nciprn = 365  
end !monthsnndata. ! 210.

! 211.
!End of procedures, 210 in all. 

!Plotting stuff:
   d ftsplt, grdcpl, nrwitg, satcpl, dpnplt
   s ftsplt = .t.  !Suppress flyback trace.
   s grdcpl = .f.  !Suppress printing of a grid on the graph.
   !nrwitg. False by default.  Rewinds .rrr file after each start or cont.
   !satcpl. False by default.  Does not suppress axis text printing.
   s dpnplt = .f.  !Suppress printing of plot number, date and time.
   d xticpl, xincpl, yticpl, yincpl  !Tic intervals, lengths of x, y axes.
   s xticpl = 1.2, xincpl = 6
   s yticpl = 1, yincpl = 5
   s nctprn = 480 !Number of characters in title array (12 lines of 40
                  !characters.
  !s tcwprn = 132 !Total character width in the print/file statement. 
                  !Not I think if printing to the screen. Needed
                  !if you are running dosacsl. Each variable occupies
                  !12 characters.  With the line number, 
                  !you can have 10 variables.

!saveics !Save the initial conditions to old.sav. See proced saveics above.
!Do not do this until you have done a start.  Which causes failure.
!Then do eg. saveics start.sav.

prepar/clear !ppp

prepar t, hour, idaymo, imonth, ijulian, month, month_r, year, iyear, &
   iday, year_calendar, year_calendar_di, yeardec, yearangle, yearangledeg, &
   daylength, light_on, thetale,  &
   s_cd, CO2vpm, CO2vpmcz, CO2inc_cc, CO2air, &
   solar_elevation_deg, solar_elevation_noon_deg, &
   nsun, nsun90, &
   jPARsc, jPARdy, jPARdye_6, jPARdy_ang, fsun, &
   fAngstrom_PAR, arg_Angstrom,  a_Angstrom, b_Angstrom, fbshrs, &
   fbshrs_monthly, m_sun, lambda_sun, lambda_sun0, &
   Tair, Tairdymn, Tairdyvr, Tsoil, rain, &
   wind, windmax, windmin, zwsin1m, &
   AtmP, VapP, RHmax, RHmin, RH, &
   gcan, rcan, denPenman, &
   Tairmax, Tairmin, daylengthhr, &
   Tair_inc, Tairdymn, Tairdyvr, &
   pulse_fire, m_kmin, m_kmin_fire, Tsoil_inc_fire, & 
   kuSOM_min, kpSOM_min, ksSOM_min, &
   INtree_fire_Namm, INsurf_li_fire_Namm, ONsurf_li_fire_Namm, &
   Nsurf_li, fTsh, fTsoil, &
   IWle, IWle_gnd, OWle, OWle_sn, OWle_prune, OWle_lf, OWle_fire, dWle, &
   IWfi_Wle, IWbud_Wle, &
   s_deciduous, s_leaf, morph, &
   comp, Dcomp, Icomp, Ocomp, kforce, &
   budb, Dbudb, Ibudb, Obudb, &
   budburst, budsopening, bb_notthisyr, &
   dorm1, dorm1q, Ddorm1, Idorm1, Odorm1, dormant, leaf_fall, kdorm1_2, &
   dorm2, Ddorm2, Idorm2, Odorm2, Odorm2z, kchill, kchillz, fTchill, &
      multfTchill, &
   jbudb, idaymobudb, imonthbudb, month_rbudb, &
   jbudsstopopening, idaymobudsstopopening, imonthbudsstopopening, &
                     month_rbso, &
   jdorm1, idaymodorm1, imonthdorm1, month_rdorm1, itdorm1plus, &
   tdorm1, days_dormancy, itau_dorm2, &
   jleaf_fall, idaymoleaf_fall, imonthleaf_fall, month_rleaf_fall, &
   jdorm2, tdorm2, idaymodorm2, imonthdorm2, month_rdorm2, &
   Mbud, IMbud, OMbud, DMbud, Gbud, kObud, &
   OCbud_gnd, ICbud, ONbud_gnd, INbud, &
   OMbud_leaf1, OMbud_leaf1z, OMbud_sn, OMbud_prune, &
   OCbud_leaf1, ONbud_leaf1, &
   DLAI, DNmin, DCtree, &
   LAI, Aleaf1, Aleaf2, Aleaf3, Aleaf4, Aleaf, &
   Pcan, s_Pcan, OWle_atm, OWle_atm_gnd, OWle_atm_gnd1, &
   OWle_rad_gnd, OWle_vdg_gnd, &
   rshrt, rlefi, &
   Onstems_th, Tsoil_inc, &
   nseeds, Dnseeds, Inseeds, Onseeds, &
   Itree_nseeds, Otree_nseeds, &
   Onseeds_death, Onseeds_germ, &
   FBRnstems, FBRnstemstr, FBRnstemstrz, &
   m_kXle?_li, kXle_li, &
   Mle, SLA, Tblack, gstom, gstom_thetale, s_gstom, rstom, &
   gstommin, gstommin350, gstommax, fCO2_gstom, gstommax350, &
   CO2vpm_div_350, &
   fisoprene, &
   m_dorm1_kXle_li, kXle_li, OXle4_li, &
   Mtree, DMtree, Mtree_gnd, MX??, z??m, MX??m, MXtree, DMXtree, &
   hstem, rhdstem, &
   fleX, fbrX, fstX, fcoX, ffiX, &
   ISGRle, &
   Wle, psiPle, psiole, psiole, psifi, psiPfi, psiofi, psigfi, &
   Wsoil, DWsoil, thetasoil, psisoil, &   
   Cle, Cbr, Cst, Cco, Cfi, &
   Nle, Nbr, Nst, Nco, Nfi, &
   aph, ala, apt, kAph_mort, fTaph_dev, fmort, fmort2yady, &
   Cphloem, Nphloem, rCNphloem, &
   CNle, CNbr, CNst, CNco, CNfi, &
   PXDMtree, &
   Csys, Nsys, Ctree, Ntree, rCNtree, &
   Clitter, Nlitter, &
   Nmin, Csol, Cbio, &
   Csoil, Nsoil, CSOM, NSOM, Cptrd, Nptrd, &
   Vptr_hayr, YC, Mbud_gnd, nstems, nstems_y1, nstems_y5, nstems_y20, &      
   INenv_dep_hayr, &
   Cpt, Cptd, Cpr, Cprd, Cptr
prepar dbudb1 !Maybe equal to Dbudb 

prepar psi??    !Water potentials and components.
prepar *1Jul15h !Prepare 1 July 15 h quantities.
prepar *1Aug15h !Prepare 1 August 15 h quantities.
prepar *tl      !Prepare terminal quantities.
prepar *ya      !Prepare yearly averages and sums.
prepar Int_*    !Prepare accumulators over the current simulation.
prepar *_av     !Prepare averages over last simulation (from t = 0).
prepar *av_yr   !Prepare average fluxes ditto.
prepar *da      !Prepare daily averages and sums.
prepar *db      !Prepare daily averages and sums.
prepar *_0h     !Prepare O h (daily) quantities.
prepar *_12h    !Prepare 12 h (daily) quantities.
prepar *_15h    !Prepare 15 h (daily) quantities.
prepar m_ksurf_li, s_diurnal
prepar s_diurnal_dat
prepar runno, nstart
preparsvs; preparDsvs
prepar treevr, soilvr, watervr, s_water
!End of prepar statements. ppp.

!Display/change parameters (see proced pars above).
!Type in the Start window e.g. "r1yr", "gr1yr".
!Or ask for a new command file. eg. ncf selfthin.cmd for self-thinning.
!ncf aphid.cmd + gostT4 for aphid T responses.
!Default environmental data is Eskdalemuir sinusoidal data, 
   !which is internal in efm.csl.
!An alternative is to type 'months12data", which addresses Eskdalemuir
   !monthly data. See proced months12data above.
!Running speed: 5yrs in 1 minute. 12 secs/yr. 60 yrs takes 12 minutes.
! test and testaphid gives some test results.
! ncf selfthin.cmd !for self-thinning steady states.
! ncf aphid.cmd ! For aphid submodel simulations.
! ncf sse.cmd eg goT0 for eskdale 60-year rotation steady-states.
! proced thinsitka ( s_thin = 1 )
!Note using ncf (as above) restores the values at the end of efm.cmd. 
   !See "save" above.
!months12data (s_months12_dat = 1, filenamem12 = months12.dat)
   !12 months environmental data. Default is months12.dat, which is a copy of
   !Eskdale.dat, for Eskdalemuir.
!aphid 1 10 ! Turn on aphid submodel and initialize.
!diurnaldata !Procedure for diurnal data input.
!dailydata !proced for daily data input from file daily.dat
!s s_dy_dat_out = 1 !Daily data is output to file dailyout.dat
!s s_daily_dat = 1.  !Read in data from file daily.dat and also output the data
                    ! to dailyout.dat
!gomnn !For inputtimg monthly data fron a GCM-generated file. eg monthsnn.dat
!godiurnaldata !For input of diurnal data. Proced no 152 in the .cmd file.
!saveics sn.sav !Sse proced saveics
!thinsitka ( tstop = 21900, s_thin = 1 )  !Also grthinsitka and 
    !prftlth_sit !Print tl data for thinsitka runs.

save !Use restore to restore this state.
!These are the default values. And "save" saves this system state.

d tstop, cint, nciout, nciprn, maxt, s_pcan, nstart, one128th, &
  filenamedi, nyears_rw_di 

!******************************************** end of file efm.cmd 

