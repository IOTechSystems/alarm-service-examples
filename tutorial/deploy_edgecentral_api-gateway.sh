#!/bin/sh

edgecentral clean 
edgecentral down 
edgecentral up --api-gateway central-ui device-modbus controller-0 controller-1 controller-2 alarm-service
