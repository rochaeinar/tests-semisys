describe('Semisys login page', function () {
    it('should able to login', function () {
        browser.get('http://localhost:4000/#!/login');

        element(by.buttonText('INICIAR SESIÓN')).click().then(function () {
            browser.wait(function () {
                return element(by.buttonText('Registrar')).isPresent();
            });
            element(by.buttonText('Registrar')).click().then(function () {
                browser.wait(function () {
                    return element(by.buttonText('Cancelar')).isPresent();
                });
                element(by.model('student.firstName')).sendKeys('StudentTest_' + Math.round(Math.random() * 100000));
                element(by.model('student.lastName')).sendKeys('StudentTest');
                element(by.model('student.ci')).sendKeys(Math.round(Math.random() * 100000));
                element(by.model('student.mail')).sendKeys('test@mail.com');
                element(by.buttonText('Siguiente')).click().then(function () {
                    browser.wait(function () {
                        return element(by.buttonText('Cancelar')).isPresent();
                    });
                    element(by.model('student.church.churchId')).sendKeys('TestChurch');
                    element(by.model('student.church.minister')).sendKeys('TestMinister');
                    element(by.buttonText('Siguiente')).click().then(function () {
                        browser.wait(function () {
                            return element(by.buttonText('Registrar')).isPresent();
                        });
                        element(by.buttonText('Registrar')).click().then(function () {
                            browser.wait(function () {
                                return element(By.xpath('//*[@id="toast-container"]/div/div[2]/div')).isPresent();
                            });
                            toastMesage = element(By.xpath('//*[@id="toast-container"]/div/div[2]/div'));
                            if (element)
                                expect(toastMesage.getText()).toEqual('El registro se creó exitosamente');
                        });
                    });
                });
            });
        });
    });
});
