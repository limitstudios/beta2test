<?php

namespace App\Security\Core\Encoder;

use Symfony\Component\Security\Core\Encoder\BasePasswordEncoder;
use Symfony\Component\Security\Core\Exception\BadCredentialsException;

class HashEncoder extends BasePasswordEncoder
{
    private $ignorePasswordCase;

    /**
     * Constructor.
     *
     * @param bool $ignorePasswordCase Compare password case-insensitive
     */
    public function __construct($ignorePasswordCase = false)
    {
        $this->ignorePasswordCase = $ignorePasswordCase;
    }

    /**
     * {@inheritdoc}
     */
    public function encodePassword($raw, $salt)
    {
        if ($this->isPasswordTooLong($raw)) {
            throw new BadCredentialsException('Invalid password.');
        }

        return hash('sha512', $this->mergePasswordAndSalt($raw, $salt));
    }

    /**
     * {@inheritdoc}
     */
    public function isPasswordValid($encoded, $raw, $salt)
    {
        if ($this->isPasswordTooLong($raw)) {
            return false;
        }

        try {
            $pass2 = $this->encodePassword($raw, $salt);
        }
        catch (BadCredentialsException $e) {
            return false;
        }

        if (!$this->ignorePasswordCase) {
            return $this->comparePasswords($encoded, $pass2);
        }

        return $this->comparePasswords(strtolower($encoded), strtolower($pass2));
    }

    protected function mergePasswordAndSalt($password, $salt)
    {
        if (empty($salt)) {
            return $password;
        }

        $password = hash('sha512', trim($password));

        return $salt.$password;
    }
}
