clc
clear all
close all

dateDataList =  ["20241211","20250731", "20250720"];

for dateData = dateDataList
    run("./runScript.m")
end

compareSimResultsWithMeasurements(dateDataList)