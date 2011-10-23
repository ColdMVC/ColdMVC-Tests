<cfoutput>
<table>
    <c:thead />
    <tbody>
        <c:each in="#paginator#" do="user">
            <tr>
                <td>#escape(user.firstName())#</td>
                <td>#escape(user.lastName())#</td>
                <td>#escape(user.email())#</td>
            </tr>
        </c:each>
    </tbody>
</table>
<c:pagination />
</cfoutput>