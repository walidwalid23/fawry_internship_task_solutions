# Step 1: Verify DNS Resolution
## Comparing resolution from /etc/resolv.conf DNS vs. 8.8.8.8 (Internal DNS vs External DNS) Using dig command:
![alt text](https://github.com/walidwalid23/fawry_internship_task_solutions/blob/main/Question2/Screenshot_one.png?raw=true)

# Step 2: Diagnose Service Reachability
## Confirm Whether The Web Service is Listening on Port 80/443 And Test the Service Reachability On Both Ports Using ss And Curl:
![alt text](https://github.com/walidwalid23/fawry_internship_task_solutions/blob/main/Question2/Screenshot_Two.png?raw=true)

# Step 3: Trace the Issue – List All Possible Causes
## 1. DNS Issues:
 * The internal DNS server may be down or misconfigured.
 * The DNS record for internal.example.com might not be set correctly.
## 2. Web Service Issues:
 * The service may not be listening on the expected ports (80 or 443).
 * There might be firewall rules blocking access to ports 80/443.
 * The web service may have crashed.
## 3. Network Configuration Issues:
 * There may be issues with routing.
 * Firewall could be blocking access to the web server's IP.

# Step 4: Propose and Apply Fixes
## 1. DNS Resolution Issues:
* How to Confirm: If dig command fails for the internal DNS.
* Fix: Restart the internal DNS server using the following linux command:
![alt text](https://github.com/walidwalid23/fawry_internship_task_solutions/blob/main/Question2/Screenshot_three.png?raw=true)
## 2. Web Service Issues:
* How to Confirm: Use the ss command from step 1 to confirm that the service is listening on the correct ports.
* Fix: Restart the web service using the following linux command:
![alt text](https://github.com/walidwalid23/fawry_internship_task_solutions/blob/main/Question2/Screenshot_four.png?raw=true)
## 3. Network Configuration Issues:
* How to Confirm: Check if curl, telnet, or nc fails to connect.
* Fix: Modify firewall rules to allow traffic to the necessary ports (80/443) and web server ip:
![alt text](https://github.com/walidwalid23/fawry_internship_task_solutions/blob/main/Question2/Screenshot_five.png?raw=true)
![alt text](https://github.com/walidwalid23/fawry_internship_task_solutions/blob/main/Question2/Screenshot_six.png?raw=true)
  

