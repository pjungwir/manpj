To get a prefilled dropdown menu:

<html:select name="item" property="status">
	<html:option value="A">Active</html:option>
	<html:option value="H">Hold</html:option>
	<html:option value="O">Obsolete</html:option>
</html:select>

That is, assume you have a bean in some scope named "item." That bean has a getter for the "status" attribute (getStatus). The returns either "A," "H," or "O." This will create a dropdown that displays "Active," "Hold," and "Obsolete." When the user submits the form, you'll have a "status" request parameter with a value of "A," "H," or "O." The cool thing is, Struts with use the "name" and "property" attributes of html:select to preselect the current value.



OR



<html:select property="market">
	<html:options collection="ALL_MARKETS" property="marketID" labelProperty="label"/>
</html:select>

This looks in some scope for a collection named "ALL_MARKETS." It should contain beans with a getMarketID method and a getLabel method, which become the id and label of the <option> tags. You should also have a getMarket method on your bean that returns a value matching the return of getMarketID.


OR


<html:select property="markets" multiple="true" size="6">
	<html:options collection="ALL_MARKETS" property="marketID" labelProperty="label"/>
</html:select>

If an item has many markets, you want the property to return an array (not a collection) of values matching the return of getMarketID(). You do not want an array of beans that also have a getMarketID() method!

