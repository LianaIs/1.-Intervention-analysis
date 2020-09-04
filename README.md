# Intervention-analysis
only the core part

In this repo I'll show you how to conduct an intervention analysis forecasting.

Intervention analysis, introduced by Box and Tiao (1975), provides a framework
for assessing the effect of an intervention on a time series under study. It is assumed that
the intervention affects the process by changing the mean function or trend of a time
series. Interventions can be natural or man-made. 

Here I'll show only the core part, meaning that I'll not waste your attention on the details of 
how to pick a submodel for SARIMA (choosing p,d,q and P,D,Q), or how to test the results.

I'll also provide the used data file (monthly volume of RA exports in 2017-20 period, source: Armstat).
