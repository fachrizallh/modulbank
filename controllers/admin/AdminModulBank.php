<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
require_once (dirname(__FILE__).'/../../classes/bank.php');
class AdminModulBankController extends ModuleAdminController{
    public function __construct()
	{
		$this->bootstrap = true;
		$this->context = Context::getContext();
	 	$this->table = 'pembayaran_bank';
	 	$this->className = 'bank';
        $this->addRowAction('edit');
        $this->addRowAction('delete');
        $this->list_no_link =true; //dari AdminTaxRulesGroupController
        $this->fieldImageSettings = array('name' => 'logo', 'dir' => 'modulbank');
		$this->fields_list = array(
            'id_pembayaran_bank' => array('title' => $this->l('ID'), 'align' => 'center', 'width' => 25),
            'logo' => array('title' => $this->l('Logo'), 'align' => 'center', 'image' => 'modulbank', 'orderby' => false, 'search' => false),
			'nama_bank' => array('title' => $this->l('Nama Bank'), 'width' => 120),
            'nama_owner' => array('title' => $this->l('Nama Pemilik Rekening'), 'width' => 120),
            'no_rekening' => array('title' => $this->l('Nomor Rekening'), 'width' => 140),
 		);
                // Set fields form for form view
		/*$this->context = Context::getContext();
		$this->context->controller = $this;
		$this->fields_form = array(
			'legend' => array('title' => $this->l('Add / Edit Pembayaran Bank'), 'image' => '../img/admin/contact.gif'),
			'input' => array(
				array('type' => 'text', 'label' => $this->l('Nama Bank'), 'name' => 'nama_bank', 'size' => 20, 'required' => true),
				array('type' => 'text', 'label' => $this->l('Nomor Rekening'), 'name' => 'rekening', 'size' => 20, 'required' => true),
			),
			'submit' => array('title' => $this->l('Save'))
		);*/
		parent::__construct();
	
                
        }
        public function renderForm()
        {
            $this->display = 'edit';
			$this->initToolbar();

            $this->fields_form = array(
                'tinymce' => TRUE,
                'legend' => array('title' => $this->l('Field'), 'image' =>
                        '../img/admin/tab-categories.gif'),
                'input' => array(
                            array(
                                'type' => 'text',
                                'label' => $this->l('Nama Bank:'),
                                'name' => 'nama_bank',
                                'id' => 'nama_bank', 
                                'required' => true,
                                'hint' => $this->l('Invalid characters:').' <>;=#{}',
                                'size' => 20),
							array(
                                'type' => 'text',
                                'label' => $this->l('Nama Pemilik Akun:'),
                                'name' => 'nama_owner',
                                'id' => 'nama_owner', 
                                'required' => true,
                                'hint' => $this->l('Invalid characters:').' <>;=#{}',
                                'size' => 20),	
                            array(
                                'type' => 'text',
                                'label' => $this->l('Nomor Rekening'),
                                'name' => 'no_rekening',
                                'id' => 'no_rekening', 
                                'required' => true,
                                'hint' => $this->l('Invalid characters:').' <>;=#{}',
                                'size' => 20),
							array(
								'type' => 'file',
								'label' => $this->l('Image:'),
								'name' => 'logo',
								'size' => 30,
								'display_image' => true,
								'desc' => $this->l('Upload payment logo from your computer')),
                    ),
                'submit' => array('title' => $this->l('Save')));
                
            return parent::renderForm();
        }
}