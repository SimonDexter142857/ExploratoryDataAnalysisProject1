# ###################################################
# Author: Simon Dexter, simondex@yahoo.com
# Date:   10/27/14
#
# Descr:  Project 1 
#         Exploratory Data Analysis class
#
# Precondition(s):
# Current working directory must contain 'household_power_consumption.txt' 
#
# ###################################################



d = read.table(
    'household_power_consumption.txt', 
    header=T, 
    colClasses='character', 
    stringsAsFactors=F,
    sep=';');

d = cbind(d, data.frame(DateConverted = as.Date(d[,1], "%d/%m/%Y") ) );



d1 = d[ d$DateConverted %in% c(
  as.Date('2007-02-01', '%Y-%m-%d'),
  as.Date('2007-02-02', '%Y-%m-%d') ),
  ];


d1 = cbind(d1, 
          data.frame(DateTime_ = paste0(d1[,1], ' ', d1[,2])  ) );

d1$DateTime_ = strptime (d1$DateTime_, '%d/%m/%Y %H:%M:%S');


d1$Global_active_power = as.numeric(d1$Global_active_power);

d1$Sub_metering_1 = as.numeric(d1$Sub_metering_1);
d1$Sub_metering_2 = as.numeric(d1$Sub_metering_2);
d1$Sub_metering_3 = as.numeric(d1$Sub_metering_3);
d1$Voltage = as.numeric(d1$Voltage);
d1$Global_reactive_power = as.numericGlobal_reactive_power;





#################################################################

png('plot3.png', width=480, height=480, units='px');


plot(
  d1$DateTime_, 
  d1$Sub_metering_1, 
  type='l',
  lwd=0.5,
  ylab='Energy sub metering',
  xlab=''
  
);

lines(
  d1$DateTime_, 
  d1$Sub_metering_2, 
  type='l',
  lwd=0.5,
  
  xlab='',
  col='red'
  
);



lines(
  d1$DateTime_, 
  d1$Sub_metering_3, 
  type='l',
  lwd=0.5,
  
  xlab='',
  col='blue'
  
);


legend('topright', 
       c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black','red','blue'), lty=c(1,1,1) );



dev.off();





#################################################################
