types
 Minutes = 0..59
 Hours = 0..23
 Seconds = 0..59
 Mode = {Clock, Chrono}
interactor main
 attributes
  [vis] dispmode: Mode
  [vis] clkmin: Minutes
  [vis] clkhour: Hours
  [vis] chsec: Seconds
  [vis] chmin: Minutes
  [vis] chhour: Hours
 actions
  [vis] clockbtn
  [vis] chronobtn
  [vis] tick
 axioms
  [] dispmode=Clock & clkmin=0 & clkhour=0 & chsec=0 & chmin=0 & chhour=0
  [clockbtn] dispmode'=Clock & keep(clkmin,clkhour,chsec,chmin,chhour)
  [chronobtn] dispmode'=Chrono & keep(clkmin,clkhour,chsec,chmin,chhour)
  dispmode=Clock & clkmin=59 & clkhour=23 -> [tick] clkmin'=0 & clkhour'=0 & keep(dispmode,chsec,chmin,chhour)
  dispmode=Clock & clkmin=59 & clkhour<23 -> [tick] clkmin'=0 & clkhour'=clkhour + 1 & keep(dispmode,chsec,chmin,chhour)
  dispmode=Clock & clkmin<59 -> [tick] clkmin'=clkmin + 1 & keep(dispmode,clkhour,chsec,chmin,chhour)
  dispmode=Chrono & chsec=59 & chmin=59 & chhour=23 -> [tick] chsec'=0 & chmin'=0 & chhour'=0 & keep(dispmode,clkmin,clkhour)
  dispmode=Chrono & chsec=59 & chmin=59 & chhour<23 -> [tick] chsec'=0 & chmin'=0 & chhour'=chhour + 1 & keep(dispmode,clkmin,clkhour)
  dispmode=Chrono & chsec=59 & chmin<59 -> [tick] chsec'=0 & chmin'=chmin + 1 & keep(dispmode,clkmin,clkhour,chhour)
  dispmode=Chrono & chsec<59 -> [tick] chsec'=chsec + 1 & keep(dispmode,clkmin,clkhour,chmin,chhour)
