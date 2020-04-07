// DO NOT EDIT: This file is automatically generated by ODM Enterprise.
// Any changes made directly to this file will be lost when it is
// automatically regenerated.

range booleanValues = 0..1;

// Input

tuple TParameter {
  key int one;
  key int nbPeriods;
  key float reservePercent;
};

tuple TUnit {
  key string name;
  string type;
  float initProdLevel;
  float minGeneration;
  float maxGeneration;
  float operatingMaxGen;
  int minUp;
  int minDown;
  float rampUp;
  float rampDown;
  float startUpCost;
  float constantCost;
  float linearCost;
  float co2Cost;
};

tuple TWeekday {
  key string name;
};
TParameter parameters = ...;
string statusCodes [-1..1] = ...;
{TUnit} units = ...;
{TWeekday} weekdays = ...;

tuple TFrozenInUse {
  key TUnit unit;
  key int period;
  int boolValue;
};

tuple TMaintenanceRule {
  key TUnit unit;
  key int periods;
  key int period1;
  key int period2;
};

tuple TMaxProdRule {
  key TUnit unit;
  key int periods;
  key int periodLength;
};

tuple TMustRunRule {
  key TUnit unit;
  key int period1;
  key int period2;
};

tuple TMustTurnOffRule {
  key TUnit unit;
  key int period1;
  key int period2;
};

tuple TPeriods {
  key int id;
  TWeekday day;
  string timeOfDay;
};

tuple TShowInUse {
  key TUnit unit;
  key int period;
  int boolValue;
};
{TFrozenInUse} frozenInUse with unit in units = ...;
{TMaintenanceRule} maintenanceRules with unit in units = ...;
{TMaxProdRule} maxProdRules with unit in units = ...;
{TMustRunRule} mustRunRules with unit in units = ...;
{TMustTurnOffRule} mustTurnOffRules with unit in units = ...;
{TPeriods} periods with day in weekdays = ...;
{TShowInUse} showInUse with unit in units = ...;

tuple TLoads {
  int load;
  key TPeriods period;
};
{TLoads} loads with period in periods = ...;

// Output

tuple TNbPlantsOnline {
  key int period;
  int value;
};

tuple TResults {
  key float avgCost;
};

tuple TSpinningReserve {
  key int period;
  float value;
};

tuple TSpinningReserveRequirement {
  key int period;
  float value;
};
{TNbPlantsOnline} nbPlantsOnline;
TResults results;
{TSpinningReserve} spinningReserve;
{TSpinningReserveRequirement} spinningReserveRequirement;

tuple TAvgCostByPeriod {
  key int period;
  float value;
};

tuple TAvgCostByUnit {
  key TUnit unit;
  float value;
};

tuple TInUse {
  key TUnit unit;
  key int period;
  int value;
};

tuple TProduction {
  key TUnit unit;
  key int period;
  float value;
};

tuple TStatus {
  key TUnit unit;
  key int period;
  int value;
};

tuple TStatusString {
  key TUnit unit;
  key int period;
  string value;
};

tuple TTurnOff {
  key TUnit unit;
  key int period;
  int value;
};

tuple TTurnOn {
  key TUnit unit;
  key int period;
  int value;
};

tuple TUtilizationOperating {
  key TUnit unit;
  float value;
};

tuple TUtilizationPhysical {
  key TUnit unit;
  float value;
};
range TAvgCostByPeriod_period_range = parameters.one..parameters.nbPeriods;
{TAvgCostByPeriod} avgCostByPeriod with period in TAvgCostByPeriod_period_range;
{TAvgCostByUnit} avgCostByUnit with unit in units;
{TInUse} inUse with unit in units, value in booleanValues;
{TProduction} production with unit in units;
{TStatus} status with unit in units;
{TStatusString} statusString with unit in units;
{TTurnOff} turnOff with unit in units, value in booleanValues;
{TTurnOn} turnOn with unit in units, value in booleanValues;
{TUtilizationOperating} utilizationOperating with unit in units;
{TUtilizationPhysical} utilizationPhysical with unit in units;