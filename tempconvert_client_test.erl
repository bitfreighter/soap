-module(tempconvert_client_test).
-compile(export_all).

-include("tempconvert.hrl").


'FahrenheitToCelsius'() -> 
    tempconvert_client:'FahrenheitToCelsius'(
        #'P0:FahrenheitToCelsius'{
            % Optional:
            'Fahrenheit' = "?"},
    _Soap_headers = [],
    _Soap_options = [{url,"http://www.w3schools.com/xml/tempconvert.asmx"}]).

'CelsiusToFahrenheit'() -> 
    tempconvert_client:'CelsiusToFahrenheit'(
        #'P0:CelsiusToFahrenheit'{
            % Optional:
            'Celsius' = "?"},
    _Soap_headers = [],
    _Soap_options = [{url,"http://www.w3schools.com/xml/tempconvert.asmx"}]).

