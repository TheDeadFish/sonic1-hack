@pushd ..
@call build.bat
@popd

@call :build "sonic1;14.13.87;Aglar"
@call :build "sonic1;14.28.6;Tee-N-Tee"
@call :build "sonic1;17.36.58;Aglar;no_zips"
@exit /B

:build
@copy /B ..\s1built.bin+%1.bin %1.gen
@exit /B
