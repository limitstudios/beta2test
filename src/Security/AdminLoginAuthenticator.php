<?php

namespace App\Security;

use Doctrine\ORM\EntityManager;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\RouterInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Core\Exception\BadCredentialsException;
use Symfony\Component\Security\Core\Exception\InvalidCsrfTokenException;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\UserProviderInterface;
use Symfony\Component\Security\Csrf\CsrfToken;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;
use Symfony\Component\Security\Guard\Authenticator\AbstractFormLoginAuthenticator;

class AdminLoginAuthenticator extends AbstractFormLoginAuthenticator
{
    private $em;
    private $encoder;
    private $router;
    private $csrfTokenManager;

    public function __construct(EntityManager $em, RouterInterface $router, UserPasswordEncoderInterface $encoder, CsrfTokenManagerInterface $csrfTokenManager)
    {
        $this->em = $em;
        $this->router = $router;
        $this->encoder = $encoder;
        $this->csrfTokenManager = $csrfTokenManager;
    }

    public function supports(Request $request)
    {
        if ($request->getPathInfo() == '/login' && $request->isMethod('POST')) {
            return true;
        }

        return false;
    }

    public function getCredentials(Request $request)
    {
        $csrfToken = $request->get('_csrf_token');
        $intention = 'authenticate';
        if (false === $this->csrfTokenManager->isTokenValid(new CsrfToken($intention, $csrfToken))) {
            throw new InvalidCsrfTokenException('Invalid CSRF token.');
        }

        $email = $request->request->get('_email');
        $session = $request->getSession();
        $session ->set(Security::LAST_USERNAME, $email);
        $password = $request->request->get('_password');

        return array(
            'email' => $email,
            'password' => $password,
            'companyID' => 1,
        );
    }

    public function getUser($credentials, UserProviderInterface $userProvider)
    {
        $email = $credentials['companyID'] . ':' . $credentials['email'];

        return $userProvider->loadUserByUsername($email);
    }

    public function checkCredentials($credentials, UserInterface $user)
    {
        $plainPassword = $credentials['password'];

        if (!$this->encoder->isPasswordValid($user, $plainPassword)) {
            throw new BadCredentialsException();
        }

        return true;
    }

    public function onAuthenticationSuccess(Request $request, TokenInterface $token, $providerKey)
    {
        $url = $this->router->generate('admin_dashboard');

        return new RedirectResponse($url);
    }

    public function onAuthenticationFailure(Request $request, AuthenticationException $exception)
    {
        $request->getSession()->set(Security::AUTHENTICATION_ERROR, $exception);

        $url = $this->router->generate('admin_login');

        return new RedirectResponse($url);
    }

    protected function getLoginUrl()
    {
        return $this->router->generate('admin_login');
    }

    protected function getDefaultSuccessRedirectUrl()
    {
        return $this->router->generate('admin_dashboard');
    }

    public function supportsRememberMe()
    {
        return false;
    }
}
