<?php

namespace App\Repository;

use Symfony\Bridge\Doctrine\Security\User\UserLoaderInterface;
use Doctrine\ORM\EntityRepository;
use Symfony\Component\Security\Core\Exception\BadCredentialsException;
use Symfony\Component\Security\Core\Exception\UsernameNotFoundException;

class UserRepository extends EntityRepository implements UserLoaderInterface
{
    public function loadUserByUsername($username)
    {
        if (strpos($username, ':') === false) {
            throw new UsernameNotFoundException('Not a valid username');
        }

        $auth = explode(":", $username);

        return $this->createQueryBuilder('u')
            ->where('u.companyID = :companyID AND u.email = :email')
            ->setParameter('companyID', $auth[0])
            ->setParameter('email', $auth[1])
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function findUsers($companyID)
    {
        return $this->getEntityManager()
            ->createQuery('
                SELECT u
                FROM App:User u
                WHERE u.companyID = :companyID
            ')
            ->setParameter('companyID', $companyID)
            ->getResult();
    }
}
