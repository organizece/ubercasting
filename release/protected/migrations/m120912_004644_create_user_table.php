<?php

class m120912_004644_create_user_table extends CDbMigration
{
	public function up()
	{
		$this->createTable('user', array(
			'id' => 'pk',
			'username' => 'string',
			'password' => 'string',
			'role' => 'string',
			)
		);
	}

	public function down()
	{
		$this->dropTable('user');
	}

}