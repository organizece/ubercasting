<?php

class m120912_010030_add_user_id_fk_to_agency_table extends CDbMigration
{
	public function up()
	{
		$this->addForeignKey('agency_user_id_fk','agency','user_id', 'user', 'id');
	}

	public function down()
	{
		$this->dropForeingKey('agency_user_id_fk', 'agency');
	}

}