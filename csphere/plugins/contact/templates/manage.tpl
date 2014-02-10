<div class="panel panel-default">
    <div class="panel-body">

        {* tpl default/com_headsearch plugin=contact action=default.manage search=subject *}

        <br />

        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>
                        <a href="{* raw order.contact_date *}">{* lang date *}</a> {* raw arrow.contact_date *}
                    </th>
                    <th>
                        <a href="{* raw order.contact_date *}">{* lang name *}</a> {* raw arrow.contact_name *}
                    </th>
                    <th>
                        <a href="{* raw order.contact_subject *}">{* lang subject *}</a> {* raw arrow.contact_subject *}
                    </th>
                    <th colspan="3">
                        {* lang default.options *}
                    </th>
                </tr>
            </thead><!--END table thead-->

            <tbody>
                {* foreach contact *}
                <tr>
                    <td>
                        {* date contact.contact_date *}
                    </td>
                    <td>
                        {* raw contact.contact_name *}
                    </td>
                    <td>
                        <a href="{* link contact/view/id/$contact.contact_id *}">{* var contact.contact_subject *}</a>
                    </td>
                    <td>
                        <a href="{* link contact/answer/id/$contact.contact_id *}">{* lang answer *}</a>
                    </td>
                    <td>
                        <a href="{* link contact/remove/id/$contact.contact_id *}">{* lang default.remove *}</a>
                    </td>
                </tr>
                {* else contact *}
                <tr>
                    <th colspan="5" class="text-center">
                        {* lang default.no_record_found *}
                    </th>
                </tr>
                {* endforeach contact *}
            </tbody><!--END table tbody-->
        </table><!--END table-->

        {* raw pages *}

    </div><!--END panel-body-->
</div><!--END panel-->