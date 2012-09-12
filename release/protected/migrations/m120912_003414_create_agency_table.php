<?php

class m120912_003414_create_agency_table extends CDbMigration
{
	public function up()
	{
        $this->createTable('agency', array(
            'id' => 'pk',
            'agency_name' => 'string',
            'agency_url' => 'string',
            'create_at' => 'timestamp',
            'updated_at' => 'timestamp',
            'user_id' => 'integer',
            )
        );
	}

	public function down()
	{
		$this->dropTable('agency');
	}

}