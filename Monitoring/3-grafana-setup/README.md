
#### Install the prerequisite package:

```sudo apt-get install libfontconfig```

### Download and install Grafana using the .deb package provided on the Grafana download page:
```
wget https://dl.grafana.com/oss/release/grafana_5.4.3_amd64.deb
sudo dpkg -i grafana_5.4.3_amd64.deb
```

#### Ensure Grafana starts at boot:
```sudo systemctl enable --now grafana-server```

### Access Grafana's web UI by going to IPADDRESS:3000.
Log in with the username admin and the password admin. Reset the password when prompted.
Add a Data Source

#### Click Add data source on the homepage.
Select Prometheus.
```Set the URL to http://localhost:9090.```
Click Save & Test.
Add a Dashboard
```
From the left menu, return Home.
Click New dashboard. The dashboard is automatically created.
Click on the gear icon to the upper right.
Set the Name of the dashboard to Forethought.
Save the changes.
```