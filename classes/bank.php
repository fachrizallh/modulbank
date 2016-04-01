<?php

class bank extends ObjectModel
{
    public $nama_bank;
    public $nama_owner;
    public $no_rekening;
	public $image_dir;
    
    public static $definition = array(
        'table' => 'pembayaran_bank',
        'primary' => 'id_pembayaran_bank',
        'fields' => array(
			'nama_bank' => array('type' => self::TYPE_STRING, 'validate' => 'isString', 'required' => true, 'size' => 20),
			'nama_owner' => array('type' => self::TYPE_STRING, 'validate' => 'isString', 'required' => true, 'size' => 20),
			'no_rekening' => array('type' => self::TYPE_STRING, 'validate' => 'isString', 'required' => true, 'size' => 20),
		),
    );
	public function __construct($id = null, $id_lang = null)
	{
		$this->image_dir = _PS_IMG_DIR_.'modulbank/';
		return parent::__construct($id, $id_lang);
	}
    public static function getBank(){
		$bank = Db::getInstance()->executeS('
		SELECT *
		FROM '._DB_PREFIX_.'pembayaran_bank');
		return $bank;
	}
	public function add($autodate = true, $null_values = false)
    {
        
        return parent::add();
    }

    public function update($null_values = FALSE)
    {
        if (parent::update($null_values)) {
            return TRUE;
        }
        
        return FALSE;
    }
    public function delete()
    {
        if (parent::delete()) {
            return TRUE;
        }
        
        return FALSE;
    }
    
}