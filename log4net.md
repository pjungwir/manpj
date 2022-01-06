If you aren't seeing log messages, try adding this to your web.config:

    <appSettings>
      <add key="log4net.Internal.Debug" value="true"/>
    </appSettings>
    ...
    <system.diagnostics>
      <trace autoflush="true">
        <listeners>
          <add 
              name="textWriterTraceListener" 
              type="System.Diagnostics.TextWriterTraceListener" 
              initializeData="C:\temp\log4net.txt" />
        </listeners>
      </trace>
    </system.diagnostics>

(from https://stackoverflow.com/questions/3121975/log4net-appenders-not-working-in-iis7-5)
