# Privileges

At first `az login` gave me an error like this:

```
The following tenants don't contain accessible subscriptions. Use 'az login --allow-no-subscriptions' to have tenant level access.
5f3158d3-e75e-45ca-8093-ded58acc913b 'Example Corp'
No subscriptions found for paul@example.com.
```

Even though I was listed as a Global Administrator and other things, I didn't have any access to the subscription.

But you can add yourself to the subscription!
In the web UI search for "Active Directory" and click on "Azure Active Directory".
Then in the left nav click "Properties" (down a ways).
At the bottom there is a toggle asking that you "can manage access to all Azure subscriptions and managements groups in this tenant".
It is off, but you can turn it on. Then click Save at the top.
After that I had to refresh the page in my browser, and I saw that the toggle stayed on.
Then I could do `az login`.
