#!/bin/sh

edgecentral clean 
edgecentral down 
edgecentral up --secret central-ui device-modbus controller-0 controller-1 controller-2 alarm-service
