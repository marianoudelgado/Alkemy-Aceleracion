//
//  SignUpViewController.swift
//  SomosMasApp
//
//  Created by Antonella Brini Vago on 04/02/2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var signUpViewModel = SignUpViewModel()
    var mailCheckCache: String?
    
    @IBOutlet weak var stackScrollViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameField: UnderlinedtextField!
    @IBOutlet weak var mailField: UnderlinedtextField!
    @IBOutlet weak var phoneField: UnderlinedtextField!
    @IBOutlet weak var passwordField: UnderlinedtextField!
    @IBOutlet weak var confirmPasswordField: UnderlinedtextField!
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var mailError: UILabel!
    @IBOutlet weak var phoneError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var confirmPasswordError: UILabel!
    @IBOutlet weak var mailAlreadyRegister: UILabel!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDismissKeyboard()
        bindData()
        hideSignUpButton()
        setupTextBehavior()
        setupTextFields()
        setupTextFieldDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setupTextFields()
    }
    
    func bindData() {
        signUpViewModel.isButtonSignUpShow.bind { [weak self] in
            $0 ? self?.showSignUpButton() : self?.hideSignUpButton()
        }
    }
    
    func showSignUpButton() {
        createAccountButton.isEnabled = true
    }
    
    private func hideSignUpButton() {
        createAccountButton.isEnabled = false
        createAccountButton.backgroundColor = .clear
    }
    
    func setupTextBehavior() {
        nameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        mailField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        phoneField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        confirmPasswordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let nameText = nameField.text,
           let emailText = mailField.text,
           let phoneText = phoneField.text,
           let passwordText = passwordField.text,
           let confirmPasswordText = confirmPasswordField.text {
            signUpViewModel.validateAccount(user: nameText, email: emailText, phone: phoneText, password: passwordText, confirmPassword: confirmPasswordText)
        }
        signUpViewModel.textFieldsInput()
    }
    
    @IBAction func createAccountAction(_ sender: Any) {
            self.mailCheckCache = mailField.text
        self.signUpViewModel.signUp(name: nameField.text ?? "", email: mailField.text ?? "", password: passwordField.text ?? "") { result in
            result ? self.showSuccesModal() : self.showErrorModal()
        }
            buttonAnimation()
        }
    
    func navigateToLogin(){
        let logInVC = LogInViewController(nibName: "LogInViewController", bundle: Bundle.main)
        self.navigationController?.pushViewController(logInVC, animated: true)
    }
    
    func buttonAnimation(){
        UIView.animate(withDuration: 0.2,
                       animations: {
            self.createAccountButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
                       completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.createAccountButton.transform = CGAffineTransform.identity
            }
        })
    }
    
    func showErrorModal(){
        let dataModalError = signUpViewModel.getTextError()
        showAlertWithTitleRetry(title: dataModalError.titleModalError, message: dataModalError.modalMessage,titleButton: dataModalError.titleButton) {
            self.mailAlreadyRegister.isHidden = false
        }
    }
    func showSuccesModal(){
        let dataModalSucces = signUpViewModel.getTextSucces()
        showAlertWithTitleRetry(title: dataModalSucces.titleModalSucces, message: dataModalSucces.modalMessage, titleButton: dataModalSucces.titleButton){
            self.navigateToLogin()
            }
    }
    
    func setupTextFieldDelegates() {
        nameField.delegate = self
        mailField.delegate = self
        phoneField.delegate = self
        passwordField.delegate = self
        confirmPasswordField.delegate = self
    }
    
    func setupTextFields() {
        self.passwordError.text = "        Contraseña incorrecta:\n                  - Mínimo 8 caracteres\n                  - Incluir caracter numérico"
        
        nameField.setupUnderline()
        mailField.setupUnderline()
        phoneField.setupUnderline()
        passwordField.setupUnderline()
        confirmPasswordField.setupUnderline()
        
        //Icons on the left of text fields
        let user = UIImage(systemName: "person")
        addLeftImage(txtField: nameField, andimage: user!)
        let mail = UIImage(systemName: "envelope")
        addLeftImage(txtField: mailField, andimage: mail!)
        let phone = UIImage(systemName: "phone")
        addLeftImage(txtField: phoneField, andimage: phone!)
        let password = UIImage(systemName: "lock")
        addLeftImage(txtField: passwordField, andimage: password!)
        let confirmPassword = UIImage(systemName: "lock.rotation")
        addLeftImage(txtField: confirmPasswordField, andimage: confirmPassword!)
    }
    
    func addLeftImage(txtField: UITextField, andimage img: UIImage) {
        let leftImageView = UIImageView()
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
}

extension SignUpViewController {
    func setUpDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
extension SignUpViewController {
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    private func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.stackScrollViewConstraint.constant = keyboardFrame.height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.stackScrollViewConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}

extension  SignUpViewController:  UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
        case self.nameField:
            nameError.isHidden = textField.text?.isValidUser ?? false
        case self.mailField:
            mailError.isHidden = textField.text?.isValidEmail ?? false
            guard let currentMail = textField.text else {return}
            guard let cacheMail = mailCheckCache else {return}
            
            if currentMail == cacheMail {
                mailAlreadyRegister.isHidden = false
            } else {
                mailAlreadyRegister.isHidden = true
            }
            
        case self.phoneField:
            phoneError.isHidden = textField.text?.isValidPhone ?? false
        case self.passwordField:
            passwordError.isHidden = textField.text?.isValidPassword ?? false
        case self.confirmPasswordField:
            if !(signUpViewModel.isMatchPassword) {
                confirmPasswordError.isHidden = false
            } else {
                confirmPasswordError.isHidden = true
            } default:
            return
        }
    }
}

